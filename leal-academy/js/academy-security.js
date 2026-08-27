/*==========================================================
LEAL ACADEMY SECURITY UI
Client-side copy deterrence + user watermark
==========================================================*/

"use strict";

const AcademySecurity = (() => {
    const blockedKeys = new Set(["a", "c", "x", "s", "p", "u"]);
    const protectedSelectors = [
        ".academy-welcome-card",
        ".academy-course-card",
        ".course-guide",
        ".track-card",
        ".course-content-panel",
        ".course-side-panel",
        ".lesson-full-content",
        ".lesson-inline-visual",
        ".lesson-rich-card",
        ".lesson-screenshot-block",
        ".lesson-command",
        ".assessment-main-panel",
        ".assessment-result",
        ".assessment-review",
        ".assessment-wrong-card",
        ".quiz-card",
        ".operational-library",
        ".library-card"
    ].join(",");

    function protectedPage(){
        if(document.body?.classList?.contains("academy-admin-page")){
            return false;
        }

        return document.body?.dataset?.academyProtected === "true" ||
            document.body?.classList?.contains("assessment-page") ||
            document.body?.classList?.contains("certificate-page");
    }

    function isAllowedTarget(target){
        if(!target?.closest){
            return false;
        }

        if(target.closest(".certificate-document")){
            return true;
        }

        if(target.closest("input, textarea, select, button, a")){
            return true;
        }

        return Boolean(target.closest("[contenteditable='true']")) &&
            !Boolean(target.closest(protectedSelectors));
    }

    function normalizeEmail(value){
        return String(value || "").trim().toLowerCase();
    }

    function selectionInsideProtectedContent(){
        const selection = window.getSelection?.();

        if(!selection || selection.rangeCount === 0 || selection.isCollapsed){
            return false;
        }

        const nodes = [selection.anchorNode, selection.focusNode];

        return nodes.some(node => {
            const element = node?.nodeType === Node.ELEMENT_NODE ? node : node?.parentElement;
            return Boolean(element?.closest?.(protectedSelectors));
        });
    }

    function isProtectedTarget(target){
        if(isAllowedTarget(target)){
            return false;
        }

        if(target?.closest?.(protectedSelectors)){
            return true;
        }

        if(selectionInsideProtectedContent()){
            return true;
        }

        return target === document ||
            target === document.body ||
            target === document.documentElement;
    }

    async function currentIdentity(){
        if(!window.AccessControl || typeof AccessControl.session !== "function"){
            return null;
        }

        const currentSession = await AccessControl.session();

        if(!currentSession?.user){
            return null;
        }

        const profile = typeof AccessControl.profileForUser === "function"
            ? AccessControl.profileForUser(currentSession.user)
            : null;

        return {
            email: currentSession.user.email || profile?.email || "",
            name: profile?.name || currentSession.user.user_metadata?.name || currentSession.user.email || ""
        };
    }

    async function isAdminIdentity(identity){
        const email = normalizeEmail(identity?.email);

        if(!email || typeof supabaseClient === "undefined" || !supabaseClient){
            return false;
        }

        try{
            const { data: adminStatus, error: rpcError } = await supabaseClient
                .rpc("is_academy_admin");

            if(!rpcError){
                return Boolean(adminStatus);
            }

            const { data, error } = await supabaseClient
                .from("academy_admins")
                .select("email")
                .eq("email", email)
                .maybeSingle();

            if(error){
                console.warn("Academy security admin check fallback:", error.message);
                return false;
            }

            return Boolean(data);
        }catch(error){
            console.warn("Academy security admin check fallback:", error.message);
            return false;
        }
    }

    function recordBlocked(action){
        if(window.AccessControl && typeof AccessControl.recordEvent === "function"){
            AccessControl.recordEvent("security_blocked_" + action, {
                metadata:{
                    path: window.location.pathname,
                    title: document.title || ""
                }
            });
        }
    }

    function blockEvent(event, action){
        if(!isProtectedTarget(event.target)){
            return;
        }

        event.preventDefault();
        recordBlocked(action);
    }

    function blockKeyboard(event){
        const key = String(event.key || "").toLowerCase();
        const ctrlOrMeta = event.ctrlKey || event.metaKey;

        if(document.body?.classList?.contains("certificate-page") && ctrlOrMeta && key === "p"){
            return;
        }

        if(ctrlOrMeta && blockedKeys.has(key)){
            blockEvent(event, "shortcut_" + key);
            return;
        }

        if(key === "printscreen"){
            blockEvent(event, "printscreen");
        }
    }

    function createWatermark(identity){
        if(document.getElementById("academySecurityWatermark")){
            return;
        }

        const label = [
            identity?.name || "Leal Academy",
            identity?.email || "acesso autenticado"
        ].filter(Boolean).join(" | ");

        const watermark = document.createElement("div");
        watermark.id = "academySecurityWatermark";
        watermark.className = "academy-security-watermark";
        watermark.textContent = label;
        document.body.appendChild(watermark);
    }

    function installGuards(){
        document.body.classList.add("academy-copy-protected");
        document.documentElement.classList.add("academy-content-protected");

        document.addEventListener("copy", event => blockEvent(event, "copy"), true);
        document.addEventListener("cut", event => blockEvent(event, "cut"), true);
        document.addEventListener("paste", event => blockEvent(event, "paste"), true);
        document.addEventListener("contextmenu", event => blockEvent(event, "contextmenu"), true);
        document.addEventListener("dragstart", event => blockEvent(event, "dragstart"), true);
        document.addEventListener("selectstart", event => blockEvent(event, "select"), true);
        document.addEventListener("keydown", blockKeyboard, true);

        window.addEventListener("beforeprint", () => {
            if(document.body?.classList?.contains("certificate-page")){
                return;
            }

            document.body.classList.add("academy-print-guard");
            recordBlocked("print");
        });

        window.addEventListener("afterprint", () => {
            document.body.classList.remove("academy-print-guard");
        });
    }

    function lockRenderedContent(){
        document.querySelectorAll(protectedSelectors).forEach(element => {
            element.setAttribute("contenteditable", "false");
            element.setAttribute("draggable", "false");
            element.setAttribute("data-academy-content-locked", "true");
        });
    }

    function observeRenderedContent(){
        lockRenderedContent();

        const observer = new MutationObserver(lockRenderedContent);
        observer.observe(document.body, {
            childList:true,
            subtree:true
        });
    }

    async function boot(){
        if(!protectedPage()){
            return;
        }

        const identity = await currentIdentity();

        if(!identity){
            return;
        }

        if(await isAdminIdentity(identity)){
            document.body.classList.add("academy-admin-unlocked");
            document.documentElement.classList.add("academy-content-admin");
            return;
        }

        installGuards();
        observeRenderedContent();
        createWatermark(identity);
    }

    return {
        boot
    };
})();

document.addEventListener("DOMContentLoaded", () => {
    AcademySecurity.boot();
});

window.AcademySecurity = AcademySecurity;
