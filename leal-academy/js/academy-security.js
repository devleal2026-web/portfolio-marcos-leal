/*==========================================================
LEAL ACADEMY SECURITY UI
Client-side copy deterrence + user watermark
==========================================================*/

"use strict";

const AcademySecurity = (() => {
    const blockedKeys = new Set(["c", "x", "s", "p", "u"]);
    const allowedSelectors = [
        "input",
        "textarea",
        "select",
        "[contenteditable='true']",
        ".certificate-document",
        ".certificate-document *"
    ].join(",");

    function protectedPage(){
        return document.body?.dataset?.academyProtected === "true" ||
            document.body?.classList?.contains("assessment-page") ||
            document.body?.classList?.contains("certificate-page") ||
            document.body?.classList?.contains("academy-admin-page");
    }

    function isAllowedTarget(target){
        return Boolean(target?.closest?.(allowedSelectors));
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
        if(isAllowedTarget(event.target)){
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

        document.addEventListener("copy", event => blockEvent(event, "copy"), true);
        document.addEventListener("cut", event => blockEvent(event, "cut"), true);
        document.addEventListener("contextmenu", event => blockEvent(event, "contextmenu"), true);
        document.addEventListener("dragstart", event => blockEvent(event, "dragstart"), true);
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

    async function boot(){
        if(!protectedPage()){
            return;
        }

        const identity = await currentIdentity();

        if(!identity){
            return;
        }

        installGuards();
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
