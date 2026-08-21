/*====================================================

VIEW MANAGER
Airport Baggage Simulator

=====================================================*/

const VIEW_WEB = "web";

const VIEW_WT = "wt";

const VIEW_COMPARE = "compare";

function mostrarModo(modo){

    const web=document.getElementById("webView");

    const wt=document.getElementById("wtView");

    const compare=document.getElementById("compareView");

    if(web)
        web.style.display="none";

    if(wt)
        wt.style.display="none";

    if(compare)
        compare.style.display="none";

    switch(modo){

        case VIEW_WEB:

            if(web)
                web.style.display="block";

            break;

        case VIEW_WT:

            if(wt)
                wt.style.display="block";

            break;

        case VIEW_COMPARE:

            if(compare)
                compare.style.display="block";

            break;

    }

}

document.addEventListener("DOMContentLoaded",()=>{

    mostrarModo(VIEW_WEB);

});