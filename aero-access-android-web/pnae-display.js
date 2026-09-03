import { supabase } from "./supabase.js";

const title = document.getElementById("displayTitle");
const companyLabel = document.getElementById("displayCompany");
const clock = document.getElementById("displayClock");
const dateLabel = document.getElementById("displayDate");
const ticker = document.getElementById("displayTicker");
const callsBox = document.getElementById("currentCalls");

let company = null;
let pnaeChannel = null;

function readJson(key) {
    try {
        return JSON.parse(localStorage.getItem(key));
    } catch {
        return null;
    }
}

function escapeHtml(value) {
    return String(value ?? "")
        .replaceAll("&", "&amp;")
        .replaceAll("<", "&lt;")
        .replaceAll(">", "&gt;")
        .replaceAll('"', "&quot;")
        .replaceAll("'", "&#039;");
}

function getQueryParam(name) {
    const params = new URLSearchParams(window.location.search);
    return params.get(name);
}

function formatDisplayDate(value) {
    if (!value) return "-";

    const raw = String(value);

    if (/^\d{4}-\d{2}-\d{2}$/.test(raw)) {
        const [year, month, day] = raw.split("-");
        return `${day}/${month}/${year}`;
    }

    const date = new Date(value);

    if (Number.isNaN(date.getTime())) return "-";

    return date.toLocaleDateString("pt-BR", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric"
    });
}

function formatTime(value) {
    if (!value) return "-";

    const date = new Date(value);

    if (Number.isNaN(date.getTime())) return "-";

    return date.toLocaleTimeString("pt-BR", {
        hour: "2-digit",
        minute: "2-digit"
    });
}

function normalizeStatus(status) {
    const value = String(status || "").toLowerCase();

    if (["anunciado", "called"].includes(value)) {
        return {
            label: "Chamado",
            className: "called"
        };
    }

    if (["aguardando", "active"].includes(value)) {
        return {
            label: "Aguardando",
            className: "waiting"
        };
    }

    return {
        label: status || "Ativo",
        className: "active"
    };
}

function updateClock() {
    const now = new Date();

    if (clock) {
        clock.textContent = now.toLocaleTimeString("pt-BR", {
            hour: "2-digit",
            minute: "2-digit"
        });
    }

    if (dateLabel) {
        dateLabel.textContent = now.toLocaleDateString("pt-BR", {
            weekday: "short",
            day: "2-digit",
            month: "2-digit",
            year: "numeric"
        });
    }
}

async function resolveCompany() {
    const companyIdFromUrl = getQueryParam("company_id");
    const companySlugFromUrl = getQueryParam("company");

    const companyAdmin = readJson("aeroCompanyAdmin");
    const currentUser = readJson("aeroCurrentUser") || readJson("currentUser");

    const companyId =
        companyIdFromUrl ||
        companyAdmin?.company_id ||
        currentUser?.company_id ||
        null;

    if (companyId) {
        const { data, error } = await supabase
            .from("aa_companies")
            .select("*")
            .eq("id", companyId)
            .maybeSingle();

        if (!error && data) {
            company = data;
            return;
        }
    }

    if (companySlugFromUrl) {
        const { data, error } = await supabase
            .from("aa_companies")
            .select("*")
            .eq("slug", companySlugFromUrl)
            .maybeSingle();

        if (!error && data) {
            company = data;
            return;
        }
    }

    const { data } = await supabase
        .from("aa_companies")
        .select("*")
        .eq("slug", "aero-access")
        .maybeSingle();

    company = data || {
        id: null,
        name: "Aero Access",
        slug: "aero-access"
    };
}

function applyCompanyHeader() {
    const companyName = company?.name || "Aero Access";

    if (title) {
        title.textContent = `Bem-vindos clientes ${companyName}`;
    }

    if (companyLabel) {
        companyLabel.textContent = companyName;
    }

    if (ticker) {
        ticker.textContent =
            `Bem-vindos clientes ${companyName}. Acompanhe neste painel as chamadas de assistência PNAE.`;
    }

    if (company?.primary_color) {
        document.documentElement.style.setProperty("--company-primary", company.primary_color);
    }

    if (company?.secondary_color) {
        document.documentElement.style.setProperty("--company-secondary", company.secondary_color);
    }
}

async function expireOldCalls() {
    if (!company?.id) return;

    const now = new Date().toISOString();

    await supabase
        .from("pnae_calls")
        .update({
            status: "expirado",
            updated_at: now
        })
        .eq("company_id", company.id)
        .lt("departure_time", now)
        .in("status", ["aguardando", "anunciado", "active", "called"]);
}

async function loadCalls() {
    if (!callsBox) return;

    if (!company?.id) {
        callsBox.innerHTML = `
            <div class="airport-empty">
                Empresa não identificada para este telão.
            </div>
        `;
        return;
    }

    await expireOldCalls();

    const now = new Date().toISOString();

    const { data, error } = await supabase
        .from("pnae_calls")
        .select("*")
        .eq("company_id", company.id)
        .gte("departure_time", now)
        .in("status", ["aguardando", "anunciado", "active", "called"])
        .order("departure_time", { ascending: true });

    if (error) {
        console.error("Erro ao carregar chamadas PNAE:", error);
        callsBox.innerHTML = `
            <div class="airport-empty">
                Erro ao carregar chamadas.
            </div>
        `;
        return;
    }

    if (!data || data.length === 0) {
        callsBox.innerHTML = `
            <div class="airport-empty">
                <strong>Nenhuma chamada PNAE ativa</strong>
                <span>${escapeHtml(company.name)}</span>
            </div>
        `;
        return;
    }

    callsBox.innerHTML = data.map((call, index) => {
        const status = normalizeStatus(call.status);
        const flightDate = call.flight_date || call.departure_time;

        return `
            <div class="airport-row ${index === 0 ? "featured" : ""}">
                <div class="airport-cell airport-passenger">
                    <span class="mobile-label">Passageiro</span>
                    <strong>${escapeHtml(call.passenger_name || "-")}</strong>
                    <small>${escapeHtml(call.assistance_type || "Assistência especial")}</small>
                </div>

                <div class="airport-cell flight">
                    <span class="mobile-label">Voo</span>
                    <strong>${escapeHtml(call.flight_number || "-")}</strong>
                </div>

                <div class="airport-cell destination">
                    <span class="mobile-label">Destino</span>
                    <strong>${escapeHtml(call.destination || "-")}</strong>
                </div>

                <div class="airport-cell">
                    <span class="mobile-label">Data</span>
                    ${escapeHtml(formatDisplayDate(flightDate))}
                </div>

                <div class="airport-cell time">
                    <span class="mobile-label">Decolagem</span>
                    <strong>${escapeHtml(formatTime(call.departure_time))}</strong>
                </div>

                <div class="airport-cell place">
                    <span class="mobile-label">Local</span>
                    ${escapeHtml(call.meeting_point || "-")}
                </div>

                <div class="airport-cell status">
                    <span class="mobile-label">Status</span>
                    <span class="airport-status ${status.className}">
                        ${escapeHtml(status.label)}
                    </span>
                </div>
            </div>
        `;
    }).join("");
}

function subscribeCalls() {
    if (!company?.id) return;

    if (pnaeChannel) {
        supabase.removeChannel(pnaeChannel);
    }

    pnaeChannel = supabase
        .channel("pnae_display_" + company.id)
        .on(
            "postgres_changes",
            { event: "*", schema: "public", table: "pnae_calls" },
            payload => {
                const row = payload.new || payload.old || {};

                if (row.company_id === company.id) {
                    loadCalls();
                }
            }
        )
        .subscribe();
}

async function initialize() {
    await resolveCompany();
    applyCompanyHeader();
    updateClock();

    await loadCalls();
    subscribeCalls();

    setInterval(updateClock, 1000);
    setInterval(loadCalls, 30000);
}

document.addEventListener("DOMContentLoaded", initialize);