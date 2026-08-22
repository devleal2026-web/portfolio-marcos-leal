/*==========================================================
ACCESS CONTROL
Supabase Google Auth + local profile cache
==========================================================*/

"use strict";

const AccessControl = (() => {
    const profileKey = "lealAcademyAuthProfile";
    const defaultReturn = "academy.html";

    function clean(value){
        return String(value ?? "").trim();
    }

    function normalizeEmail(value){
        return clean(value).toLowerCase();
    }

    function currentMode(){
        const script = document.currentScript || document.querySelector("script[data-access]");
        return script?.dataset?.access || "protected";
    }

    function currentPathName(){
        return window.location.pathname.split("/").pop().toLowerCase();
    }

    function accessPagePath(){
        const path = window.location.pathname;

        if(path.includes("/pages/worldtracer/")){
            return "../access.html";
        }

        if(path.includes("/pages/")){
            return "access.html";
        }

        return "pages/access.html";
    }

    function adminPagePath(){
        const path = window.location.pathname;

        if(path.includes("/pages/worldtracer/")){
            return "../admin.html";
        }

        if(path.includes("/pages/")){
            return "admin.html";
        }

        return "pages/admin.html";
    }

    function loginReturnUrl(){
        const params = new URLSearchParams(window.location.search);
        const target = params.get("return");

        if(target && !/^https?:\/\//i.test(target)){
            return target;
        }

        return defaultReturn;
    }

    function protectedReturnValue(){
        const path = window.location.pathname;
        const file = currentPathName();
        const query = window.location.search || "";

        if(path.includes("/pages/worldtracer/")){
            return "worldtracer/" + file + query;
        }

        if(path.includes("/pages/")){
            return file + query;
        }

        return "../index.html" + query;
    }

    function redirectToLogin(){
        const target = accessPagePath() + "?return=" + encodeURIComponent(protectedReturnValue());
        window.location.replace(target);
    }

    async function session(){
        if(typeof supabaseClient === "undefined" || !supabaseClient.auth){
            return null;
        }

        const { data } = await supabaseClient.auth.getSession();
        return data?.session || null;
    }

    function userDisplayName(user){
        return clean(
            user?.user_metadata?.full_name ||
            user?.user_metadata?.name ||
            user?.email?.split("@")[0] ||
            "Usuário"
        );
    }

    function readLocalProfile(){
        try{
            return JSON.parse(localStorage.getItem(profileKey)) || null;
        }catch{
            return null;
        }
    }

    function saveLocalProfile(profile){
        localStorage.setItem(profileKey, JSON.stringify({
            id: profile.id || "",
            name: clean(profile.name),
            email: normalizeEmail(profile.email),
            role: profile.role || "user",
            lastAccess: new Date().toISOString()
        }));
    }

    function profileForUser(user){
        const cached = readLocalProfile();
        const email = normalizeEmail(user?.email);

        if(cached && normalizeEmail(cached.email) === email && cached.name){
            return cached;
        }

        return {
            id: user?.id || "",
            name: userDisplayName(user),
            email,
            role: "user"
        };
    }

    async function upsertProfile(profile){
        if(typeof supabaseClient === "undefined"){
            return;
        }

        let accessCount = 1;

        try{
            const { data } = await supabaseClient
                .from("access_profiles")
                .select("access_count")
                .eq("id", profile.id)
                .maybeSingle();

            accessCount = Number(data?.access_count || 0) + 1;
        }catch{
            accessCount = 1;
        }

        const payload = {
            id: profile.id,
            full_name: profile.name,
            email: profile.email,
            access_count: accessCount,
            last_access_at: new Date().toISOString()
        };

        const { error } = await supabaseClient
            .from("access_profiles")
            .upsert([payload], { onConflict:"id" });

        if(error){
            console.warn("Access profile fallback:", error.message);
        }
    }

    async function recordEvent(eventType, details = {}){
        const currentSession = await session();

        if(!currentSession || typeof supabaseClient === "undefined"){
            return;
        }

        const profile = profileForUser(currentSession.user);

        const payload = {
            user_id: currentSession.user.id,
            email: normalizeEmail(currentSession.user.email || profile.email),
            full_name: clean(profile.name),
            event_type: clean(eventType) || "page_view",
            page_title: document.title || "",
            page_path: window.location.pathname + window.location.search,
            course_id: details.courseId || null,
            course_title: details.courseTitle || null,
            metadata: details.metadata || {}
        };

        const { error } = await supabaseClient
            .from("academy_access_events")
            .insert([payload]);

        if(error){
            console.warn("Academy analytics event fallback:", error.message);
        }
    }

    async function syncCourseProgress(course, completedLessons = []){
        const currentSession = await session();

        if(!currentSession || typeof supabaseClient === "undefined" || !course){
            return;
        }

        const profile = profileForUser(currentSession.user);
        const totalLessons = Array.isArray(course.modules) ? course.modules.length : 0;
        const completedCount = completedLessons.length;
        const progressPercent = totalLessons > 0
            ? Math.round((completedCount / totalLessons) * 100)
            : 0;
        const now = new Date().toISOString();

        const payload = {
            user_id: currentSession.user.id,
            email: normalizeEmail(currentSession.user.email || profile.email),
            full_name: clean(profile.name),
            course_id: course.id,
            course_title: course.title,
            total_lessons: totalLessons,
            completed_lessons: completedLessons,
            completed_count: completedCount,
            progress_percent: progressPercent,
            last_activity_at: now,
            completed_at: progressPercent >= 100 ? now : null
        };

        const { error } = await supabaseClient
            .from("academy_course_progress")
            .upsert([payload], { onConflict:"user_id,course_id" });

        if(error){
            console.warn("Academy progress sync fallback:", error.message);
        }
    }

    async function recordQuizAttempt(course, result){
        const currentSession = await session();

        if(!currentSession || typeof supabaseClient === "undefined" || !course || !result){
            return;
        }

        const profile = profileForUser(currentSession.user);

        const payload = {
            user_id: currentSession.user.id,
            email: normalizeEmail(currentSession.user.email || profile.email),
            full_name: clean(profile.name),
            course_id: course.id,
            course_title: course.title,
            score_percent: Number(result.percent) || 0,
            grade: Number(result.grade) || 0,
            correct_count: Number(result.correct) || 0,
            total_questions: Number(result.total) || 0,
            approved: Boolean(result.approved),
            review: result.review || []
        };

        const { error } = await supabaseClient
            .from("academy_quiz_attempts")
            .insert([payload]);

        if(error){
            console.warn("Academy quiz sync fallback:", error.message);
        }
    }

    async function recordCertificate(certificate){
        const currentSession = await session();

        if(!currentSession || typeof supabaseClient === "undefined" || !certificate){
            return;
        }

        const profile = profileForUser(currentSession.user);

        const payload = {
            certificate_code: certificate.id,
            user_id: currentSession.user.id,
            email: normalizeEmail(currentSession.user.email || profile.email),
            full_name: clean(profile.name),
            student_name: certificate.studentName || profile.name,
            student_email: certificate.studentEmail || currentSession.user.email || profile.email,
            course_id: certificate.courseId,
            course_title: certificate.courseTitle,
            grade: Number(certificate.grade || certificate.score) || 0,
            score_percent: Number(certificate.percent) || 0,
            correct_count: Number(certificate.correct) || 0,
            total_questions: Number(certificate.total) || 0,
            issued_at: certificate.issuedAt || new Date().toISOString()
        };

        const { error } = await supabaseClient
            .from("academy_certificates")
            .upsert([payload], { onConflict:"certificate_code" });

        if(error){
            console.warn("Academy certificate sync fallback:", error.message);
        }
    }

    async function signInWithGoogle(){
        if(typeof supabaseClient === "undefined" || !supabaseClient.auth){
            alert("Supabase Auth não carregado.");
            return;
        }

        const { error } = await supabaseClient.auth.signInWithOAuth({
            provider:"google",
            options:{
                redirectTo: window.location.href
            }
        });

        if(error){
            console.error(error);
            alert(error.message);
        }
    }

    async function signOut(){
        localStorage.removeItem(profileKey);

        if(typeof supabaseClient !== "undefined" && supabaseClient.auth){
            await supabaseClient.auth.signOut();
        }

        window.location.href = accessPagePath ? accessPagePath() : "access.html";
    }

    function updateIdentity(profile){
        const name = clean(profile?.name) || "Usuário";
        const email = normalizeEmail(profile?.email);

        document.getElementById("operatorName")?.replaceChildren(document.createTextNode(name));
        document.getElementById("operatorRole")?.replaceChildren(document.createTextNode(email || "Acesso autenticado"));

        const welcome = document.getElementById("academyWelcomeTitle");
        if(welcome){
            welcome.textContent = `Olá, ${name}. Escolha seu curso.`;
        }

        if(!document.getElementById("btnSecureLogout")){
            const host = document.querySelector(".topbar") || document.querySelector(".academy-home-actions") || document.querySelector(".navbar .ms-auto");

            if(host){
                const button = document.createElement("button");
                button.id = "btnSecureLogout";
                button.type = "button";
                button.className = "secure-logout-button";
                button.textContent = "Sair";
                button.addEventListener("click", signOut);
                host.appendChild(button);
            }
        }
    }

    async function isAdminProfile(profile){
        const email = normalizeEmail(profile?.email);

        if(!email){
            return false;
        }

        if(typeof supabaseClient === "undefined"){
            return false;
        }

        try{
            const { data, error } = await supabaseClient
                .from("academy_admins")
                .select("email")
                .eq("email", email)
                .maybeSingle();

            if(error){
                console.warn("Academy admin check fallback:", error.message);
                return false;
            }

            return Boolean(data);
        }catch(error){
            console.warn("Academy admin check fallback:", error.message);
            return false;
        }
    }

    async function showAdminAccess(profile){
        if(document.getElementById("btnAcademyAdmin")){
            return;
        }

        const allowed = await isAdminProfile(profile);

        if(!allowed){
            return;
        }

        const host =
            document.querySelector(".academy-home-actions") ||
            document.querySelector(".sidebar nav") ||
            document.querySelector(".topbar") ||
            document.querySelector(".navbar .ms-auto");

        if(!host){
            return;
        }

        const link = document.createElement("a");
        link.id = "btnAcademyAdmin";
        link.href = adminPagePath();
        link.textContent = "Admin";

        if(host.matches(".topbar")){
            link.className = "secure-logout-button";
        }

        host.appendChild(link);
    }

    async function requireAuth(){
        const currentSession = await session();

        if(!currentSession){
            redirectToLogin();
            return false;
        }

        const profile = profileForUser(currentSession.user);
        saveLocalProfile(profile);
        updateIdentity(profile);
        await upsertProfile(profile);
        await showAdminAccess(profile);
        recordEvent("page_view");
        return true;
    }

    async function initLoginPage(){
        const signedOut = document.getElementById("authSignedOut");
        const signedIn = document.getElementById("authSignedIn");
        const profileForm = document.getElementById("authProfileForm");
        const nameInput = document.getElementById("authFullName");
        const emailInput = document.getElementById("authEmail");
        const userName = document.getElementById("authUserName");
        const userEmail = document.getElementById("authUserEmail");
        const message = document.getElementById("authMessage");
        const profileMessage = document.getElementById("authProfileMessage");
        const currentSession = await session();

        document.getElementById("btnGoogleAccess")?.addEventListener("click", signInWithGoogle);
        document.getElementById("btnLogoutAccess")?.addEventListener("click", signOut);
        document.getElementById("btnLogoutProfile")?.addEventListener("click", signOut);
        document.getElementById("btnContinueAccess")?.addEventListener("click", () => {
            window.location.href = loginReturnUrl();
        });

        if(!currentSession){
            if(signedOut) signedOut.hidden = false;
            if(signedIn) signedIn.hidden = true;
            if(profileForm) profileForm.hidden = true;
            if(message) message.textContent = "";
            return;
        }

        const user = currentSession.user;
        const profile = profileForUser(user);
        const needsName = !readLocalProfile() || !readLocalProfile().name;

        if(needsName){
            if(signedOut) signedOut.hidden = true;
            if(signedIn) signedIn.hidden = true;
            if(profileForm) profileForm.hidden = false;
            if(nameInput) nameInput.value = profile.name;
            if(emailInput) emailInput.value = profile.email;
            nameInput?.focus();
        }else{
            if(signedOut) signedOut.hidden = true;
            if(profileForm) profileForm.hidden = true;
            if(signedIn) signedIn.hidden = false;
            if(userName) userName.textContent = profile.name;
            if(userEmail) userEmail.textContent = profile.email;
            window.setTimeout(() => {
                window.location.href = loginReturnUrl();
            }, 700);
        }

        profileForm?.addEventListener("submit", async event => {
            event.preventDefault();

            const fullName = clean(nameInput?.value);

            if(fullName.length < 3){
                if(profileMessage) profileMessage.textContent = "Informe seu nome completo.";
                return;
            }

            const finalProfile = {
                id: user.id,
                name: fullName,
                email: normalizeEmail(user.email),
                role: "user"
            };

            saveLocalProfile(finalProfile);
            await upsertProfile(finalProfile);

            if(profileMessage) profileMessage.textContent = "Acesso confirmado. Abrindo plataforma...";

            window.setTimeout(() => {
                window.location.href = loginReturnUrl();
            }, 450);
        });
    }

    async function boot(){
        const mode = currentMode();

        if(mode === "login"){
            await initLoginPage();
            return;
        }

        if(mode === "public"){
            return;
        }

        await requireAuth();
    }

    return {
        boot,
        requireAuth,
        signInWithGoogle,
        signOut,
        readLocalProfile,
        profileForUser,
        recordEvent,
        syncCourseProgress,
        recordQuizAttempt,
        recordCertificate
    };
})();

document.addEventListener("DOMContentLoaded", () => {
    AccessControl.boot();
});

window.AccessControl = AccessControl;


