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

        const payload = {
            id: profile.id,
            full_name: profile.name,
            email: profile.email,
            last_access_at: new Date().toISOString()
        };

        const { error } = await supabaseClient
            .from("access_profiles")
            .upsert([payload], { onConflict:"id" });

        if(error){
            console.warn("Access profile fallback:", error.message);
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

    async function requireAuth(){
        const currentSession = await session();

        if(!currentSession){
            redirectToLogin();
            return false;
        }

        const profile = profileForUser(currentSession.user);
        saveLocalProfile(profile);
        updateIdentity(profile);
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
        profileForUser
    };
})();

document.addEventListener("DOMContentLoaded", () => {
    AccessControl.boot();
});

window.AccessControl = AccessControl;


