/*==========================================================
MATCH ENGINE
AHL x OHD
==========================================================*/

"use strict";

const MatchEngine = (() => {

    const MIN_PERCENTAGE = 50;

    const FIELD_RULES = [
        {
            ahl:"tn",
            ohd:"tn",
            weight:35,
            label:"TN / Tag Number",
            mode:"exact"
        },
        {
            ahl:"ct",
            ohd:"ct",
            weight:12,
            label:"CT / Color-Type",
            mode:"similar"
        },
        {
            ahl:"bi",
            ohd:"bi",
            weight:8,
            label:"BI / Brand",
            mode:"similar"
        },
        {
            ahl:"bw",
            ohd:"bw",
            weight:6,
            label:"BW / Baggage Weight",
            mode:"number"
        },
        {
            ahl:"fd",
            ohd:"fd",
            weight:7,
            label:"FD / Flight-Date",
            mode:"similar"
        },
        {
            ahl:"rt",
            ohd:"rt",
            weight:8,
            label:"RT / Route",
            mode:"similar"
        },
        {
            ahl:"nm",
            ohd:"nm",
            weight:8,
            label:"NM / Passenger Name",
            mode:"similar"
        },
        {
            ahl:"it",
            ohd:"it",
            weight:3,
            label:"IT / Initials",
            mode:"exact"
        },
        {
            ahl:"ea",
            ohd:"ea",
            weight:8,
            label:"EA / E-mail",
            mode:"exact"
        },
        {
            ahl:"cp",
            ohd:"bp",
            weight:8,
            label:"CP-BP / Phone",
            mode:"phone"
        },
        {
            ahl:"pn",
            ohd:"bp",
            weight:6,
            label:"PN-BP / Phone",
            mode:"phone"
        },
        {
            ahl:"pa",
            ohd:"ab",
            weight:8,
            label:"PA-AB / Address",
            mode:"similar"
        },
        {
            ahl:"pc",
            ohd:"ab",
            weight:5,
            label:"PC-AB / City in Address",
            mode:"similar"
        },
        {
            ahl:"co",
            ohd:"ab",
            weight:4,
            label:"CO-AB / Country in Address",
            mode:"similar"
        },
        {
            ahl:"ta",
            ohd:"ab",
            weight:5,
            label:"TA-AB / Temporary Address",
            mode:"similar"
        },
        {
            ahl:"ag",
            ohd:"ag",
            weight:4,
            label:"AG / Agent",
            mode:"similar"
        },
        {
            ahl:"description",
            ohd:"description",
            weight:6,
            label:"Description",
            mode:"similar"
        },
        {
            ahl:"description",
            ohd:"cc",
            weight:8,
            label:"Description-CC / Contents",
            mode:"similar"
        },
        {
            ahl:"bi",
            ohd:"cc",
            weight:5,
            label:"BI-CC / Brand in Contents",
            mode:"similar"
        },
        {
            ahl:"ct",
            ohd:"cc",
            weight:5,
            label:"CT-CC / Type in Contents",
            mode:"similar"
        },
        {
            ahl:"cc",
            ohd:"cc",
            weight:12,
            label:"CC / Contents",
            mode:"similar"
        },
        {
            ahl:"cc",
            ohd:"description",
            weight:6,
            label:"CC-Description / Contents",
            mode:"similar"
        },
        {
            ahl:"description",
            ohd:"cc",
            weight:8,
            label:"Description-CC / Contents",
            mode:"similar"
        },
    ];

    function text(value){
        return String(value ?? "")
            .trim()
            .toUpperCase()
            .normalize("NFD")
            .replace(/[\u0300-\u036f]/g, "");
    }

    function onlyNumbers(value){
        return String(value ?? "")
            .replace(/\D/g, "");
    }

    function tokens(value){
        return text(value)
            .replace(/[^A-Z0-9/ ]/g, " ")
            .split(/[\s/]+/)
            .filter(token => token.length >= 2);
    }

    function hasValue(value){
        return text(value) !== "";
    }

    function exactScore(a, b){
        const left = text(a);
        const right = text(b);

        if(left === "" || right === ""){
            return 0;
        }

        if(left === right){
            return 1;
        }

        if(left.includes(right) || right.includes(left)){
            return 0.75;
        }

        return 0;
    }

    function phoneScore(a, b){
        const left = onlyNumbers(a);
        const right = onlyNumbers(b);

        if(left.length < 6 || right.length < 6){
            return 0;
        }

        if(left === right){
            return 1;
        }

        if(left.endsWith(right) || right.endsWith(left)){
            return 0.85;
        }

        return 0;
    }

    function similarScore(a, b){
        const left = tokens(a);
        const right = tokens(b);

        if(left.length === 0 || right.length === 0){
            return 0;
        }

        let hits = 0;

        left.forEach(token => {
            if(right.includes(token)){
                hits++;
                return;
            }

            const partial = right.some(other =>
                token.length >= 4 &&
                other.length >= 4 &&
                (token.includes(other) || other.includes(token))
            );

            if(partial){
                hits += 0.6;
            }
        });

        return Math.min(
            1,
            hits / Math.max(left.length, right.length)
        );
    }

    function numberScore(a, b){
        if(a === null || b === null || a === undefined || b === undefined){
            return 0;
        }

        const left = Number(a);
        const right = Number(b);

        if(Number.isNaN(left) || Number.isNaN(right)){
            return 0;
        }

        const diff = Math.abs(left - right);

        if(diff === 0){
            return 1;
        }

        if(diff <= 2){
            return 0.85;
        }

        if(diff <= 5){
            return 0.5;
        }

        return 0;
    }

    function calculateRuleScore(rule, ahl, ohd){
        const left = ahl[rule.ahl];
        const right = ohd[rule.ohd];

        if(!hasValue(left) || !hasValue(right)){
            return {
                score:0,
                ratio:0
            };
        }

        let ratio = 0;

        switch(rule.mode){
            case "exact":
                ratio = exactScore(left, right);
                break;

            case "phone":
                ratio = phoneScore(left, right);
                break;

            case "number":
                ratio = numberScore(left, right);
                break;

            default:
                ratio = similarScore(left, right);
        }

        return {
            score:rule.weight * ratio,
            ratio
        };
    }

    function compare(ahl, ohd){
        let score = 0;
        let possible = 0;

        const reasons = [];

        FIELD_RULES.forEach(rule => {
            const left = ahl[rule.ahl];
            const right = ohd[rule.ohd];

            if(!hasValue(left) || !hasValue(right)){
                return;
            }

            possible += rule.weight;

            const result = calculateRuleScore(rule, ahl, ohd);

            if(result.ratio >= 0.5){
                score += result.score;

                reasons.push({
                    field:rule.label,
                    percentage:Math.round(result.ratio * 100),
                    ahl_value:left,
                    ohd_value:right
                });
            }
        });

        if(possible === 0){
            return {
                percentage:0,
                reasons:[]
            };
        }

        let percentage = Math.round((score / possible) * 100);

        if(sameStrongTag(ahl, ohd)){
            percentage = Math.max(percentage, 75);
        }

        percentage = Math.min(100, percentage);

        return {
            percentage,
            reasons
        };
    }

    function sameStrongTag(ahl, ohd){
        return text(ahl.tn) !== "" && text(ahl.tn) === text(ohd.tn);
    }

    async function saveMatch(ahl, ohd, result){
        if(result.percentage < MIN_PERCENTAGE){
            return null;
        }

        const payload = {
            ahl_id: ahl.id,
            ohd_id: ohd.id,
            ahl_reference: ahl.reference_number,
            ohd_reference: ohd.reference_number,
            percentage: result.percentage,
            reasons: result.reasons,
            updated_at: new Date().toISOString()
        };

        const { data, error } = await supabaseClient
            .from("baggage_matches")
            .upsert(payload, {
                onConflict:"ahl_id,ohd_id"
            })
            .select()
            .single();

        if(error){
            console.error(error);
            return null;
        }

        return data;
    }

    async function processAhl(ahl){
        const { data, error } = await supabaseClient
            .from("ohd_cases")
            .select("*")
            .eq("status", "ABERTO");

        if(error){
            console.error(error);
            return [];
        }

        const matches = [];

        for(const ohd of data){
            const result = compare(ahl, ohd);
            const saved = await saveMatch(ahl, ohd, result);

            if(saved){
                matches.push(saved);
            }
        }

        return matches;
    }

    async function processOhd(ohd){
        const { data, error } = await supabaseClient
            .from("ahl_cases")
            .select("*")
            .eq("status", "ABERTO");

        if(error){
            console.error(error);
            return [];
        }

        const matches = [];

        for(const ahl of data){
            const result = compare(ahl, ohd);
            const saved = await saveMatch(ahl, ohd, result);

            if(saved){
                matches.push(saved);
            }
        }

        return matches;
    }

    async function getBestMatches(type){
        const column = type === "ahl" ? "ahl_id" : "ohd_id";

        const { data, error } = await supabaseClient
            .from("baggage_matches")
            .select("*")
            .order("percentage", { ascending:false });

        if(error){
            console.error(error);
            return {};
        }

        const map = {};

        data.forEach(match => {
            const id = match[column];

            if(!map[id] || match.percentage > map[id].percentage){
                map[id] = match;
            }
        });

        return map;
    }

    async function alertPending(type){
        const viewedColumn = type === "ahl"
            ? "viewed_by_ahl"
            : "viewed_by_ohd";

        const { data, error } = await supabaseClient
            .from("baggage_matches")
            .select("*")
            .eq(viewedColumn, false)
            .order("percentage", { ascending:false });

        if(error){
            console.error(error);
            return;
        }

        if(!data || data.length === 0){
            return;
        }

        showPopup(type, data);
    }

    function showPopup(type, matches){
        const old = document.getElementById("matchAlertModal");

        if(old){
            old.remove();
        }

        const html = `
            <div class="modal fade" id="matchAlertModal" tabindex="-1">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content bg-dark text-light">
                        <div class="modal-header border-secondary">
                            <h5 class="modal-title">Matches encontrados</h5>

                            <button
                                type="button"
                                class="btn-close btn-close-white"
                                data-bs-dismiss="modal">
                            </button>
                        </div>

                        <div class="modal-body">
                            ${matches.map(match => `
                                <div class="border border-secondary rounded p-3 mb-2">
                                    <div class="fw-bold text-warning fs-5">
                                        ${match.percentage}% de compatibilidade
                                    </div>

                                    <div>
                                        AHL: ${match.ahl_reference || "-"}
                                    </div>

                                    <div>
                                        OHD: ${match.ohd_reference || "-"}
                                    </div>

                                    <div class="mt-2 small text-secondary">
                                        Campos compatíveis:
                                    </div>

                                    <ul class="mt-1 mb-0">
                                        ${(match.reasons || []).map(reason => `
                                            <li>
                                                <strong>${reason.field}</strong>
                                                - ${reason.percentage}%
                                            </li>
                                        `).join("")}
                                    </ul>
                                </div>
                            `).join("")}
                        </div>

                        <div class="modal-footer border-secondary">
                            <button
                                type="button"
                                class="btn btn-warning"
                                data-bs-dismiss="modal">
                                Visualizado
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        `;

        document.body.insertAdjacentHTML("beforeend", html);

        const modalEl = document.getElementById("matchAlertModal");

        modalEl.addEventListener("hidden.bs.modal", async () => {
            await markViewed(type, matches);
        });

        bootstrap.Modal
            .getOrCreateInstance(modalEl)
            .show();
    }

    async function markViewed(type, matches){
        const field = type === "ahl"
            ? "viewed_by_ahl"
            : "viewed_by_ohd";

        for(const match of matches){
            await supabaseClient
                .from("baggage_matches")
                .update({
                    [field]:true,
                    updated_at:new Date().toISOString()
                })
                .eq("id", match.id);
        }
    }

    function matchBadge(match){
        if(!match){
            return "";
        }

        return `
            <span class="badge bg-warning text-dark ms-2">
                Match ${match.percentage}%
            </span>
        `;
    }
async function getMatchesGrouped(type){
    const column = type === "ahl" ? "ahl_id" : "ohd_id";

    const { data, error } = await supabaseClient
        .from("baggage_matches")
        .select("*")
        .order("percentage", { ascending:false });

    if(error){
        console.error(error);
        return {};
    }

    const map = {};

    data.forEach(match => {
        const id = match[column];

        if(!map[id]){
            map[id] = [];
        }

        map[id].push(match);
    });

    return map;
}

function matchPanel(type, ownerId, matches){

    if(!matches || matches.length === 0){
        return `
            <span class="text-secondary small">
                Sem match
            </span>
        `;
    }

    const best = matches[0];

    const collapseId =
        "matches_" +
        type +
        "_" +
        String(ownerId).replace(/[^a-zA-Z0-9]/g, "");

    const listHtml = matches.map(match => {

        const oppositeReference = type === "ahl"
            ? match.ohd_reference
            : match.ahl_reference;

        const oppositeLabel = type === "ahl"
            ? "OHD"
            : "AHL";

        const reasonsHtml = (match.reasons || [])
            .slice(0, 6)
            .map(reason => {

                if(typeof reason === "string"){
                    return `<li>${reason}</li>`;
                }

                return `
                    <li>
                        ${reason.field || "Campo compatível"}
                        ${reason.percentage ? "- " + reason.percentage + "%" : ""}
                    </li>
                `;

            })
            .join("");

        const actionHtml = type === "ahl"
            ? `
                <button
                    type="button"
                    class="btn btn-outline-warning btn-sm"
                    onclick="OhdFlow.open('ROH', '${match.id}')">
                    Solicitar OHD - ROH
                </button>
            `
            : `
                <span class="text-secondary small">
                    ROH recebido aparecerá no histórico deste OHD.
                </span>
            `;

        return `
            <div class="border border-secondary rounded p-2 mb-2 bg-dark">

                <div class="d-flex justify-content-between align-items-center gap-2">

                    <strong>
                        ${oppositeLabel}: ${oppositeReference || "-"}
                    </strong>

                    <span class="badge bg-warning text-dark">
                        ${match.percentage}%
                    </span>

                </div>

                <ul class="small mt-2 mb-0">
                    ${reasonsHtml}
                </ul>

                <div class="mt-2 d-flex gap-2 flex-wrap">
                    ${actionHtml}
                </div>

            </div>
        `;

    }).join("");

    const bestReference = type === "ahl"
        ? best.ohd_reference
        : best.ahl_reference;

    const bestLabel = type === "ahl"
        ? "OHD"
        : "AHL";

    return `
        <div class="match-box">

            <button
                type="button"
                class="btn btn-warning btn-sm text-dark fw-bold"
                data-bs-toggle="collapse"
                data-bs-target="#${collapseId}"
                aria-expanded="false"
                aria-controls="${collapseId}">

                Melhor: ${bestLabel} ${bestReference || "-"} - ${best.percentage}%

            </button>

            <div class="collapse mt-2" id="${collapseId}">
                ${listHtml}
            </div>

        </div>
    `;

}
return {
    processAhl,
    processOhd,
    alertPending,
    getBestMatches,
    getMatchesGrouped,
    matchBadge,
    matchPanel
};

})();