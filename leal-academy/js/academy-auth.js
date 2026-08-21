/*==========================================================
ACADEMY ACCESS
Cadastro simples por Nome + Gmail
==========================================================*/

"use strict";

const AcademyAuth = (() => {
    const storageKey = "airportBaggageAcademyUser";

    function normalizeEmail(email){
        return String(email || "").trim().toLowerCase();
    }

    function cleanName(name){
        return String(name || "").trim().replace(/\s+/g, " ");
    }

    function isGmail(email){
        return /^[^\s@]+@gmail\.com$/i.test(normalizeEmail(email));
    }

    function getProfile(){
        try{
            const profile = JSON.parse(localStorage.getItem(storageKey));

            if(!profile || !profile.name || !profile.email){
                return null;
            }

            return profile;
        }catch{
            return null;
        }
    }

    function saveProfile(name, email){
        const profile = {
            name: cleanName(name),
            email: normalizeEmail(email),
            lastAccess: new Date().toISOString()
        };

        localStorage.setItem(storageKey, JSON.stringify(profile));
        return profile;
    }

    function clearProfile(){
        localStorage.removeItem(storageKey);
    }

    function firstName(profile){
        const name = cleanName(profile && profile.name);
        return name || "aluno";
    }

    function returnUrl(){
        const params = new URLSearchParams(window.location.search);
        const target = params.get("return");

        if(target && !/^https?:\/\//i.test(target)){
            return target;
        }

        return "academy.html";
    }

    function accessPageUrl(){
        const current = window.location.pathname.split("/").pop() + window.location.search;
        return "academy-access.html?return=" + encodeURIComponent(current);
    }

    function requireAccess(){
        if(getProfile()){
            return true;
        }

        window.location.replace(accessPageUrl());
        return false;
    }

    function initAccessPage(){
        const form = document.getElementById("academyAccessForm");
        const message = document.getElementById("academyAccessMessage");
        const autoBox = document.getElementById("academyAutoAccess");
        const autoName = document.getElementById("academyAutoName");
        const continueButton = document.getElementById("academyContinueButton");
        const switchButton = document.getElementById("academySwitchUserButton");
        const profile = getProfile();

        function go(){
            window.location.href = returnUrl();
        }

        if(profile){
            if(form){
                form.hidden = true;
            }

            if(autoBox){
                autoBox.hidden = false;
            }

            if(autoName){
                autoName.textContent = `${profile.name} (${profile.email})`;
            }

            window.setTimeout(go, 900);
        }

        continueButton?.addEventListener("click", go);

        switchButton?.addEventListener("click", () => {
            clearProfile();

            if(autoBox){
                autoBox.hidden = true;
            }

            if(form){
                form.hidden = false;
                form.reset();
                document.getElementById("academyUserName")?.focus();
            }
        });

        form?.addEventListener("submit", event => {
            event.preventDefault();

            const name = cleanName(document.getElementById("academyUserName")?.value);
            const email = normalizeEmail(document.getElementById("academyUserEmail")?.value);

            if(name.length < 3){
                if(message){
                    message.textContent = "Informe seu nome completo para acessar a plataforma.";
                }
                return;
            }

            if(!isGmail(email)){
                if(message){
                    message.textContent = "Use um endereço Gmail válido, por exemplo: nome@gmail.com.";
                }
                return;
            }

            saveProfile(name, email);

            if(message){
                message.textContent = "Cadastro concluído. Abrindo seus cursos...";
            }

            window.setTimeout(go, 450);
        });
    }

    return {
        getProfile,
        saveProfile,
        clearProfile,
        firstName,
        requireAccess,
        initAccessPage
    };
})();

window.AcademyAuth = AcademyAuth;

if(document.body?.dataset.academyProtected === "true"){
    AcademyAuth.requireAccess();
}

document.addEventListener("DOMContentLoaded", () => {
    if(document.getElementById("academyAccessForm")){
        AcademyAuth.initAccessPage();
    }
});

