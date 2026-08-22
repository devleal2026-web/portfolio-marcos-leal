"use strict";

(function(){
    const storageKey = "lealAcademyTheme";
    const darkTheme = "dark";
    const lightTheme = "light";

    function savedTheme(){
        const stored = localStorage.getItem(storageKey);

        if(stored === darkTheme || stored === lightTheme){
            return stored;
        }

        return window.matchMedia &&
            window.matchMedia("(prefers-color-scheme: dark)").matches
            ? darkTheme
            : lightTheme;
    }

    function applyTheme(theme){
        const normalized = theme === darkTheme ? darkTheme : lightTheme;
        document.documentElement.dataset.theme = normalized;
        localStorage.setItem(storageKey, normalized);
        updateButton(normalized);
    }

    function updateButton(theme){
        const button = document.getElementById("academyThemeToggle");

        if(!button){
            return;
        }

        const isDark = theme === darkTheme;
        button.textContent = isDark ? "Modo claro" : "Modo noturno";
        button.setAttribute("aria-pressed", String(isDark));
        button.setAttribute(
            "title",
            isDark ? "Alternar para modo claro" : "Alternar para modo noturno"
        );
    }

    function createButton(){
        if(document.getElementById("academyThemeToggle")){
            updateButton(document.documentElement.dataset.theme);
            return;
        }

        const button = document.createElement("button");
        button.id = "academyThemeToggle";
        button.className = "academy-theme-toggle secondary-action";
        button.type = "button";
        button.addEventListener("click", () => {
            const current = document.documentElement.dataset.theme;
            applyTheme(current === darkTheme ? lightTheme : darkTheme);
        });

        const targets = [
            document.querySelector(".academy-home-actions"),
            document.querySelector(".academy-admin-actions"),
            document.querySelector(".course-meta-row"),
            document.querySelector(".assessment-header"),
            document.querySelector(".academy-auth-card"),
            document.querySelector(".manual-actions")
        ].filter(target => target && !target.closest("[hidden]"));

        const target = targets[0];

        if(target){
            target.appendChild(button);
        }
        else{
            document.body.appendChild(button);
        }

        updateButton(document.documentElement.dataset.theme);
    }

    applyTheme(savedTheme());

    document.addEventListener("DOMContentLoaded", createButton);

    window.LealAcademyTheme = {
        apply: applyTheme,
        current(){
            return document.documentElement.dataset.theme || lightTheme;
        }
    };
})();
