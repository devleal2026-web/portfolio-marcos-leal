import { supabase } from "./supabase.js";
import { checkPassengerAccess, getPassenger } from "./auth.js";

let passenger = null;
let passengerRequestsChannel = null;

function readJsonStorage(key) {
    const raw = localStorage.getItem(key);

    if (!raw) return null;

    try {
        return JSON.parse(raw);
    } catch (error) {
        console.error("Erro ao ler localStorage:", key, error);
        return null;
    }
}

function normalizePassenger(source) {
    if (!source) return null;

    const basePassenger = source.passenger || source;

    if (!basePassenger || !basePassenger.email) return null;

    const company =
        basePassenger.aa_companies ||
        basePassenger.company ||
        source.company ||
        source.aa_companies ||
        null;

    return {
        ...basePassenger,
        id: basePassenger.id || source.id || "",
        name: basePassenger.name || source.name || "",
        email: basePassenger.email || source.email || "",
        phone: basePassenger.phone || basePassenger.whatsapp || source.phone || source.whatsapp || "",
        whatsapp: basePassenger.whatsapp || basePassenger.phone || source.whatsapp || source.phone || "",
        company_id: basePassenger.company_id || source.company_id || company?.id || "",
        aa_companies: company
    };
}

function getLoggedPassenger() {
    const possibleKeys = [
        "aeroPassenger",
        "currentPassenger",
        "passenger"
    ];

    for (const key of possibleKeys) {
        const value = normalizePassenger(readJsonStorage(key));

        if (value && value.email) {
            return value;
        }
    }

    const currentUser =
        readJsonStorage("aeroCurrentUser") ||
        readJsonStorage("currentUser");

    if (currentUser && (currentUser.type === "passenger" || currentUser.role === "passenger")) {
        const value = normalizePassenger(currentUser);

        if (value && value.email) {
            return value;
        }
    }

    try {
        const value = normalizePassenger(getPassenger());

        if (value && value.email) {
            return value;
        }
    } catch (error) {
        console.error("Erro ao recuperar passageiro pelo auth.js:", error);
    }

    return null;
}

function saveNormalizedPassengerSession(currentPassenger) {
    const session = {
        type: "passenger",
        role: "passenger",
        id: currentPassenger.id,
        name: currentPassenger.name,
        email: currentPassenger.email,
        phone: currentPassenger.phone || currentPassenger.whatsapp || "",
        whatsapp: currentPassenger.whatsapp || currentPassenger.phone || "",
        company_id: currentPassenger.company_id || "",
        company: currentPassenger.aa_companies || null,
        passenger: currentPassenger
    };

    localStorage.setItem("aeroUserType", "passenger");
    localStorage.setItem("aeroPassenger", JSON.stringify(currentPassenger));
    localStorage.setItem("aeroCurrentUser", JSON.stringify(session));

    localStorage.setItem("userType", "passenger");
    localStorage.setItem("currentPassenger", JSON.stringify(currentPassenger));
    localStorage.setItem("currentUser", JSON.stringify(session));
    localStorage.setItem("passenger", JSON.stringify(currentPassenger));
}

function redirectToLogin() {
    window.location.href = "login-passenger.html";
}

function initializePassengerAccess() {
    passenger = getLoggedPassenger();

    if (!passenger) {
        try {
            checkPassengerAccess();
            passenger = normalizePassenger(getPassenger());
        } catch (error) {
            console.error("Acesso de passageiro não encontrado:", error);
        }
    }

    if (!passenger || !passenger.email) {
        redirectToLogin();
        return false;
    }

    saveNormalizedPassengerSession(passenger);
    return true;
}

function getElement(id) {
    return document.getElementById(id);
}

function setText(id, text) {
    const element = getElement(id);

    if (element) {
        element.textContent = text;
    }
}

function setHtml(id, html) {
    const element = getElement(id);

    if (element) {
        element.innerHTML = html;
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

function formatDateTime(value) {
    if (!value) return "-";

    const date = new Date(value);

    if (Number.isNaN(date.getTime())) return "-";

    return date.toLocaleString("pt-BR", {
        day: "2-digit",
        month: "2-digit",
        year: "numeric",
        hour: "2-digit",
        minute: "2-digit"
    });
}

function formatDuration(startValue, endValue) {
    if (!startValue) return "-";

    const start = new Date(startValue);
    const end = endValue ? new Date(endValue) : new Date();

    if (Number.isNaN(start.getTime()) || Number.isNaN(end.getTime())) {
        return "-";
    }

    const diffMs = Math.max(0, end.getTime() - start.getTime());
    const totalMinutes = Math.floor(diffMs / 60000);
    const hours = Math.floor(totalMinutes / 60);
    const minutes = totalMinutes % 60;

    if (hours > 0) {
        return `${hours}h ${String(minutes).padStart(2, "0")}min`;
    }

    return `${minutes}min`;
}

document.addEventListener("DOMContentLoaded", () => {
    if (!initializePassengerAccess()) return;

    const nameInput = getElement("name");

    if (nameInput) {
        nameInput.value = passenger.name || "";
    }

    applyCompanyContext();
    bindLocationFields();
    loadMyRequests();
    subscribePassengerRequests();
});

function bindLocationFields() {
    const locationSelect = getElement("location");
    const destinationSelect = getElement("destination");

    if (locationSelect) {
        locationSelect.addEventListener("change", event => {
            const otherLocation = getElement("otherLocation");

            if (otherLocation) {
                otherLocation.style.display =
                    event.target.value === "outro" ? "block" : "none";
            }
        });
    }

    if (destinationSelect) {
        destinationSelect.addEventListener("change", event => {
            const otherDestination = getElement("otherDestination");

            if (otherDestination) {
                otherDestination.style.display =
                    event.target.value === "outro" ? "block" : "none";
            }
        });
    }
}

function applyCompanyContext() {
    const company = passenger.aa_companies || passenger.company;

    if (!company) return;

    const title = document.querySelector("h2");

    if (title) {
        title.textContent = `Solicitar Atendimento - ${company.name}`;
    }

    if (company.primary_color) {
        document.documentElement.style.setProperty("--company-primary", company.primary_color);
    }

    if (company.secondary_color) {
        document.documentElement.style.setProperty("--company-secondary", company.secondary_color);
    }
}

window.requestHelp = async () => {
    const status = getElement("status");

    let location = getElement("location")?.value || "";
    let destination = getElement("destination")?.value || "";
    const notes = getElement("notes")?.value?.trim() || "";

    if (location === "outro") {
        location = getElement("otherLocation")?.value?.trim() || "";
    }

    if (destination === "outro") {
        destination = getElement("otherDestination")?.value?.trim() || "";
    }

    if (!location || !destination) {
        alert("Informe origem e destino.");
        return;
    }

    if (!passenger.company_id) {
        alert("Seu cadastro não possui empresa vinculada. Acesse o cadastro novamente, escolha uma empresa e use a mesma senha para vincular.");
        return;
    }

    if (status) {
        status.textContent = "Procurando agente disponível da sua empresa...";
    }

    const { data, error } = await supabase.rpc("create_service_request", {
        p_company_id: passenger.company_id,
        p_passenger_name: passenger.name,
        p_passenger_email: passenger.email,
        p_passenger_location: location,
        p_destination_location: destination,
        p_notes: notes
    });

    if (error) {
        if (status) {
            status.textContent = error.message || "Nenhum agente disponível.";
        }
        return;
    }

    localStorage.setItem("currentRequest", data.id);

    if (status) {
        status.innerHTML = `
            Atendimento criado.<br>
            Empresa: <strong>${escapeHtml(passenger.aa_companies?.name || passenger.company?.name || "-")}</strong><br>
            Agente: <strong>${escapeHtml(data.agent_name || "-")}</strong><br>
            Status: aguardando aceite.
        `;
    }

    const chatButton = getElement("chatButton");

    if (chatButton) {
        chatButton.style.display = "block";
    }

    loadMyRequests();
};

window.openPassengerChat = () => {
    const requestId = localStorage.getItem("currentRequest");

    if (!requestId) {
        alert("Nenhum atendimento ativo.");
        return;
    }

    window.location.href = "chat.html?request=" + encodeURIComponent(requestId);
};

window.openRequestChat = requestId => {
    localStorage.setItem("currentRequest", requestId);
    window.location.href = "chat.html?request=" + encodeURIComponent(requestId);
};

async function loadMyRequests() {
    const box = getElement("myRequests");

    if (!box) return;

    let query = supabase
        .from("requests")
        .select("*")
        .eq("passenger_email", passenger.email)
        .order("created_at", { ascending: false });

    if (passenger.company_id) {
        query = query.eq("company_id", passenger.company_id);
    }

    const { data, error } = await query;

    if (error) {
        console.error("Erro ao carregar histórico do passageiro:", error);
        box.innerHTML = "<p>Erro ao carregar histórico.</p>";
        return;
    }

    if (!data || data.length === 0) {
        box.innerHTML = "<p>Nenhum atendimento encontrado.</p>";
        return;
    }

    box.innerHTML = data.map(req => {
        const startTime = req.started_at || req.accepted_at || req.created_at;
        const endTime = req.finished_at || req.completed_at || req.ended_at || null;

        return `
            <div class="agent-card">
                <p><strong>Origem:</strong> ${escapeHtml(req.passenger_location || "-")}</p>
                <p><strong>Destino:</strong> ${escapeHtml(req.destination_location || "-")}</p>
                <p><strong>Agente:</strong> ${escapeHtml(req.agent_name || "-")}</p>
                <p><strong>Status:</strong> ${escapeHtml(req.status || "-")}</p>
                <p><strong>Início:</strong> ${escapeHtml(formatDateTime(startTime))}</p>
                <p><strong>Término:</strong> ${escapeHtml(formatDateTime(endTime))}</p>
                <p><strong>Duração:</strong> ${escapeHtml(formatDuration(startTime, endTime))}</p>
                <button onclick="openRequestChat('${escapeHtml(req.id)}')">Abrir Chat</button>
            </div>
        `;
    }).join("");
}

function subscribePassengerRequests() {
    if (!passenger || !passenger.email) return;

    if (passengerRequestsChannel) {
        supabase.removeChannel(passengerRequestsChannel);
    }

    passengerRequestsChannel = supabase
        .channel("passenger_requests_" + (passenger.id || passenger.email))
        .on(
            "postgres_changes",
            { event: "*", schema: "public", table: "requests" },
            payload => {
                const newRequest = payload.new || {};

                const samePassenger =
                    String(newRequest.passenger_email || "").toLowerCase() ===
                    String(passenger.email || "").toLowerCase();

                const sameCompany =
                    !passenger.company_id ||
                    !newRequest.company_id ||
                    newRequest.company_id === passenger.company_id;

                if (samePassenger && sameCompany) {
                    loadMyRequests();
                }
            }
        )
        .subscribe();
}