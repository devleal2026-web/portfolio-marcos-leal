import { supabase } from "./supabase.js";

let currentCompany = null;
let currentCompanyId = null;
let pnaeChannel = null;

function esc(value) {
    return String(value ?? "")
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

function readJson(key) {
    try {
        return JSON.parse(localStorage.getItem(key));
    } catch {
        return null;
    }
}

function getCurrentCompanyId() {
    const companyAdmin = readJson("aeroCompanyAdmin");
    const currentUser = readJson("aeroCurrentUser") || readJson("currentUser");

    return (
        companyAdmin?.company_id ||
        currentUser?.company_id ||
        null
    );
}

function getCurrentCompanyFromSession() {
    const companyAdmin = readJson("aeroCompanyAdmin");
    const currentUser = readJson("aeroCurrentUser") || readJson("currentUser");

    return (
        companyAdmin?.company ||
        currentUser?.company ||
        null
    );
}

function getFlightDateFromInput(value) {
    if (!value) return null;

    return String(value).split("T")[0] || null;
}

function normalizeFlightNumberValue(value) {
    return String(value || "")
        .trim()
        .toUpperCase()
        .replace(/\s+/g, "");
}

function formatDate(value) {
    if (!value) return "-";

    const date = new Date(value);

    if (Number.isNaN(date.getTime())) return "-";

    return date.toLocaleString("pt-BR");
}

function formatFlightDate(value) {
    if (!value) return "-";

    const safeValue = String(value);

    if (/^\d{4}-\d{2}-\d{2}$/.test(safeValue)) {
        const [year, month, day] = safeValue.split("-");
        return `${day}/${month}/${year}`;
    }

    const date = new Date(value);

    if (Number.isNaN(date.getTime())) return "-";

    return date.toLocaleDateString("pt-BR");
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

function getInput(id) {
    return document.getElementById(id);
}

function setPnaeMessage(text, type = "info") {
    let message = document.getElementById("pnaeMessage");

    if (!message) {
        const panel = document.getElementById("pnaeControl");
        message = document.createElement("div");
        message.id = "pnaeMessage";
        message.className = "pnae-message";

        if (panel) {
            panel.insertBefore(message, document.getElementById("pnaeCalls"));
        }
    }

    message.className = `pnae-message ${type}`;
    message.textContent = text;

    setTimeout(() => {
        message.textContent = "";
        message.className = "pnae-message";
    }, 5000);
}

function clearPnaeForm() {
    getInput("pnaePassengerName").value = "";
    getInput("pnaeFlightNumber").value = "";
    getInput("pnaeDestination").value = "";
    getInput("pnaeDepartureTime").value = "";
    getInput("pnaeAssistanceType").value = "";
    getInput("pnaeMeetingPoint").value = "";
    getInput("pnaeNotes").value = "";
}

function updatePnaeCompanyHeader() {
    const panel = document.getElementById("pnaeControl");

    if (!panel) return;

    let badge = document.getElementById("pnaeCompanyBadge");

    if (!badge) {
        badge = document.createElement("p");
        badge.id = "pnaeCompanyBadge";
        badge.className = "pnae-company-badge";

        const title = panel.querySelector("h2");
        if (title) {
            title.insertAdjacentElement("afterend", badge);
        }
    }

    badge.textContent = currentCompany?.name
        ? `Empresa do telão: ${currentCompany.name}`
        : "Empresa do telão não identificada";
}

const airportNames = {
    GRU: { pt: "Guarulhos", en: "Guarulhos", es: "Guarulhos" },
    CGH: { pt: "Congonhas", en: "Congonhas", es: "Congonhas" },
    GIG: { pt: "Rio de Janeiro", en: "Rio de Janeiro", es: "Río de Janeiro" },
    SDU: { pt: "Santos Dumont", en: "Santos Dumont", es: "Santos Dumont" },
    BSB: { pt: "Brasília", en: "Brasilia", es: "Brasilia" },
    CNF: { pt: "Confins", en: "Confins", es: "Confins" },
    VCP: { pt: "Viracopos", en: "Viracopos", es: "Viracopos" },
    SSA: { pt: "Salvador", en: "Salvador", es: "Salvador" },
    REC: { pt: "Recife", en: "Recife", es: "Recife" },
    FOR: { pt: "Fortaleza", en: "Fortaleza", es: "Fortaleza" },
    POA: { pt: "Porto Alegre", en: "Porto Alegre", es: "Porto Alegre" },
    CWB: { pt: "Curitiba", en: "Curitiba", es: "Curitiba" },
    FLN: { pt: "Florianópolis", en: "Florianopolis", es: "Florianópolis" },
    NAT: { pt: "Natal", en: "Natal", es: "Natal" },
    BEL: { pt: "Belém", en: "Belem", es: "Belém" },
    MAO: { pt: "Manaus", en: "Manaus", es: "Manaus" },
    MIA: { pt: "Miami", en: "Miami", es: "Miami" },
    JFK: { pt: "Nova York", en: "New York", es: "Nueva York" },
    EWR: { pt: "Newark", en: "Newark", es: "Newark" },
    MCO: { pt: "Orlando", en: "Orlando", es: "Orlando" },
    LIS: { pt: "Lisboa", en: "Lisbon", es: "Lisboa" },
    MAD: { pt: "Madri", en: "Madrid", es: "Madrid" },
    CDG: { pt: "Paris", en: "Paris", es: "París" },
    FCO: { pt: "Roma", en: "Rome", es: "Roma" },
    LHR: { pt: "Londres", en: "London", es: "Londres" },
    EZE: { pt: "Buenos Aires", en: "Buenos Aires", es: "Buenos Aires" },
    SCL: { pt: "Santiago", en: "Santiago", es: "Santiago" },
    LIM: { pt: "Lima", en: "Lima", es: "Lima" },
    BOG: { pt: "Bogotá", en: "Bogota", es: "Bogotá" },
    MEX: { pt: "Cidade do México", en: "Mexico City", es: "Ciudad de México" }
};

const airlineNames = {
    LA: { pt: "Latám", en: "LATAM", es: "LATAM" },
    JJ: { pt: "Latám", en: "LATAM", es: "LATAM" },
    G3: { pt: "Gol", en: "Gol", es: "Gol" },
    AD: { pt: "Azul", en: "Azul", es: "Azul" },
    TP: { pt: "TAP", en: "TAP", es: "TAP" },
    AA: { pt: "American Airlines", en: "American Airlines", es: "American Airlines" },
    DL: { pt: "Delta", en: "Delta", es: "Delta" },
    UA: { pt: "United", en: "United", es: "United" },
    AV: { pt: "Avianca", en: "Avianca", es: "Avianca" },
    AR: { pt: "Aerolíneas Argentinas", en: "Aerolineas Argentinas", es: "Aerolíneas Argentinas" },
    IB: { pt: "Iberia", en: "Iberia", es: "Iberia" },
    AF: { pt: "Air France", en: "Air France", es: "Air France" },
    KL: { pt: "KLM", en: "KLM", es: "KLM" },
    LH: { pt: "Lufthansa", en: "Lufthansa", es: "Lufthansa" },
    EK: { pt: "Emirates", en: "Emirates", es: "Emirates" },
    QR: { pt: "Qatar Airways", en: "Qatar Airways", es: "Qatar Airways" },
    CM: { pt: "Copa Airlines", en: "Copa Airlines", es: "Copa Airlines" }
};

const digitWords = {
    pt: {
        0: "zero",
        1: "um",
        2: "dois",
        3: "três",
        4: "quatro",
        5: "cinco",
        6: "seis",
        7: "sete",
        8: "oito",
        9: "nove"
    },
    en: {
        0: "zero",
        1: "one",
        2: "two",
        3: "three",
        4: "four",
        5: "five",
        6: "six",
        7: "seven",
        8: "eight",
        9: "nine"
    },
    es: {
        0: "cero",
        1: "uno",
        2: "dos",
        3: "tres",
        4: "cuatro",
        5: "cinco",
        6: "seis",
        7: "siete",
        8: "ocho",
        9: "nueve"
    }
};

const commonTranslations = {
    wheelchair: {
        pt: "cadeira de rodas",
        en: "wheelchair assistance",
        es: "asistencia con silla de ruedas"
    },
    specialAssistance: {
        pt: "assistência especial",
        en: "special assistance",
        es: "asistencia especial"
    },
    assistanceDesk: {
        pt: "balcão de assistência",
        en: "the assistance desk",
        es: "el mostrador de asistencia"
    },
    gate: {
        pt: "portão de embarque",
        en: "the boarding gate",
        es: "la puerta de embarque"
    },
    checkin: {
        pt: "check-in",
        en: "check-in counter",
        es: "mostrador de check-in"
    },
    departureHall: {
        pt: "saguão de embarque",
        en: "the departure hall",
        es: "la sala de embarque"
    },
    informationDesk: {
        pt: "balcão de informações",
        en: "the information desk",
        es: "el mostrador de información"
    }
};

function translateFreeText(value, lang = "pt") {
    const clean = String(value || "").trim();

    if (!clean) return "";

    const normalized = clean
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "");

    if (
        normalized.includes("cadeira") ||
        normalized.includes("roda") ||
        normalized.includes("wheelchair")
    ) {
        return commonTranslations.wheelchair[lang];
    }

    if (
        normalized.includes("portao") ||
        normalized.includes("gate")
    ) {
        return commonTranslations.gate[lang];
    }

    if (
        normalized.includes("check")
    ) {
        return commonTranslations.checkin[lang];
    }

    if (
        normalized.includes("saguao") ||
        normalized.includes("embarque") ||
        normalized.includes("departure")
    ) {
        return commonTranslations.departureHall[lang];
    }

    if (
        normalized.includes("informacao") ||
        normalized.includes("informacoes") ||
        normalized.includes("information")
    ) {
        return commonTranslations.informationDesk[lang];
    }

    if (
        normalized.includes("balcao") ||
        normalized.includes("assistencia") ||
        normalized.includes("desk")
    ) {
        return commonTranslations.assistanceDesk[lang];
    }

    if (
        normalized.includes("especial") ||
        normalized.includes("special")
    ) {
        return commonTranslations.specialAssistance[lang];
    }

    return clean;
}

function destinationName(destination, lang = "pt") {
    const clean = String(destination || "").trim();
    const upper = clean.toUpperCase();

    if (airportNames[upper]) {
        return airportNames[upper][lang] || airportNames[upper].pt;
    }

    return translateFreeText(clean, lang) || clean;
}

function spellFlightCode(code) {
    return String(code || "")
        .toUpperCase()
        .split("")
        .join(" ");
}

function spellFlightDigits(number, lang = "pt") {
    const dictionary = digitWords[lang] || digitWords.pt;

    return String(number || "")
        .split("")
        .map(digit => dictionary[digit] || digit)
        .join(", ");
}

function airlineName(code, lang = "pt") {
    const upper = String(code || "").toUpperCase();

    if (airlineNames[upper]) {
        return airlineNames[upper][lang] || airlineNames[upper].pt;
    }

    return spellFlightCode(upper);
}

function normalizeFlightNumber(value, lang = "pt") {
    const raw = String(value || "").trim().toUpperCase();
    const match = raw.match(/^([A-Z0-9]{2,3})\s*[- ]?\s*(\d+)$/);

    if (!match) return raw;

    const code = match[1];
    const number = match[2];

    const airline = airlineName(code, lang);
    const digits = spellFlightDigits(number, lang);

    return `${airline}, ${digits}`;
}

function buildAnnouncement(call, lang = "pt") {
    const name = call.passenger_name || "passageiro";
    const flight = normalizeFlightNumber(call.flight_number, lang);
    const destination = destinationName(call.destination, lang);
    const time = formatTime(call.departure_time);

    const meetingPoint =
        translateFreeText(call.meeting_point, lang) ||
        commonTranslations.assistanceDesk[lang];

    if (lang === "en") {
        return [
            "Attention, please.",
            `Passenger ${name}.`,
            `Your flight is ${flight}, to ${destination}.`,
            `The scheduled departure time is ${time}.`,
            `Please proceed to ${meetingPoint}.`,
            "Thank you."
        ].join(" ");
    }

    if (lang === "es") {
        return [
            "Atención, por favor.",
            `Pasajero ${name}.`,
            `Su vuelo es ${flight}, con destino a ${destination}.`,
            `La salida está prevista para las ${time}.`,
            `Por favor, diríjase a ${meetingPoint}.`,
            "Gracias."
        ].join(" ");
    }

    return [
        "Atenção, por gentileza.",
        `Passageiro ${name}.`,
        `Seu voo é ${flight}, com destino a ${destination}.`,
        `A decolagem está prevista para as ${time}.`,
        `Por favor, dirija-se ao ${meetingPoint}.`,
        "     ",
        "Obrigado."
    ].join(" ");
}

function getVoices() {
    return window.speechSynthesis.getVoices() || [];
}

function scoreVoice(voice, lang) {
    const name = `${voice.name || ""} ${voice.voiceURI || ""}`.toLowerCase();
    const voiceLang = String(voice.lang || "").toLowerCase();

    let score = 0;

    if (lang === "pt-BR" && voiceLang === "pt-br") score += 100;
    if (lang === "en-US" && voiceLang === "en-us") score += 100;
    if (lang === "es-419" && (voiceLang === "es-419" || voiceLang.startsWith("es-"))) score += 100;

    if (voiceLang.startsWith(lang.slice(0, 2).toLowerCase())) score += 40;

    if (/male|masculin|masculino|homem|man|paulo|carlos|daniel|felipe|jorge|diego|miguel|juan/i.test(name)) {
        score += 35;
    }

    if (/female|feminina|mulher|woman|maria|luciana|helena|sofia|monica|paulina/i.test(name)) {
        score -= 20;
    }

    if (/google|microsoft|natural|online|neural/i.test(name)) {
        score += 20;
    }

    return score;
}

function getBestVoice(lang) {
    const voices = getVoices();

    if (!voices.length) return null;

    return voices
        .slice()
        .sort((a, b) => scoreVoice(b, lang) - scoreVoice(a, lang))[0] || null;
}

function speakOne(text, lang, options = {}) {
    return new Promise(resolve => {
        if (!("speechSynthesis" in window)) {
            alert("Este dispositivo não suporta anúncio por voz.");
            resolve();
            return;
        }

        const utterance = new SpeechSynthesisUtterance(text);

        utterance.lang = lang;
        utterance.rate = options.rate || 0.86;
        utterance.pitch = options.pitch || 0.82;
        utterance.volume = 1;

        const voice = getBestVoice(lang);

        if (voice) {
            utterance.voice = voice;
        }

        utterance.onend = resolve;
        utterance.onerror = resolve;

        window.speechSynthesis.speak(utterance);
    });
}

function wait(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function speakMultilingualAnnouncement(call) {
    if (!("speechSynthesis" in window)) {
        alert("Este dispositivo não suporta anúncio por voz.");
        return;
    }

    window.speechSynthesis.cancel();

    await speakOne(buildAnnouncement(call, "pt"), "pt-BR", {
        rate: 0.88,
        pitch: 0.82
    });

    await wait(700);

    await speakOne(buildAnnouncement(call, "en"), "en-US", {
        rate: 0.84,
        pitch: 0.84
    });

    await wait(700);

    await speakOne(buildAnnouncement(call, "es"), "es-419", {
        rate: 0.84,
        pitch: 0.84
    });
}

if ("speechSynthesis" in window) {
    window.speechSynthesis.onvoiceschanged = () => {
        window.speechSynthesis.getVoices();
    };
}

async function resolveCurrentCompany() {
    currentCompanyId = getCurrentCompanyId();
    currentCompany = getCurrentCompanyFromSession();

    if (currentCompanyId && !currentCompany) {
        const { data } = await supabase
            .from("aa_companies")
            .select("*")
            .eq("id", currentCompanyId)
            .maybeSingle();

        currentCompany = data || null;
    }

    updatePnaeCompanyHeader();
}

async function expireOldPnaeCalls() {
    if (!currentCompanyId) return;

    const now = new Date().toISOString();

    const { error } = await supabase
        .from("pnae_calls")
        .update({
            status: "expirado",
            updated_at: now
        })
        .eq("company_id", currentCompanyId)
        .lt("departure_time", now)
        .in("status", ["aguardando", "anunciado", "active", "called"]);

    if (error) {
        console.error("Erro ao expirar chamadas PNAE:", error);
    }
}

window.addPnaeCall = async () => {
    const passengerName = getInput("pnaePassengerName").value.trim();
    const flightNumber = normalizeFlightNumberValue(getInput("pnaeFlightNumber").value);
    const destination = getInput("pnaeDestination").value.trim();
    const departureTime = getInput("pnaeDepartureTime").value;
    const assistanceType = getInput("pnaeAssistanceType").value.trim();
    const meetingPoint = getInput("pnaeMeetingPoint").value.trim();
    const notes = getInput("pnaeNotes").value.trim();

    if (!currentCompanyId) {
        setPnaeMessage(
            "Empresa não identificada. Acesse pelo painel da empresa para cadastrar chamadas PNAE.",
            "error"
        );
        return;
    }

    if (!passengerName || !flightNumber || !destination || !departureTime) {
        setPnaeMessage(
            "Preencha nome, voo, destino e horário de decolagem.",
            "error"
        );
        return;
    }

    const departureIso = new Date(departureTime).toISOString();
    const flightDate = getFlightDateFromInput(departureTime);

    setPnaeMessage("Cadastrando passageiro PNAE...", "info");

    const { data, error } = await supabase
        .from("pnae_calls")
        .insert([{
            company_id: currentCompanyId,
            passenger_name: passengerName,
            flight_number: flightNumber,
            flight_date: flightDate,
            destination,
            departure_time: departureIso,
            assistance_type: assistanceType,
            meeting_point: meetingPoint,
            notes,
            status: "aguardando",
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString()
        }])
        .select()
        .single();

    if (error) {
        console.error("Erro ao cadastrar PNAE:", error);

        setPnaeMessage(
            "Erro ao cadastrar PNAE: " + error.message,
            "error"
        );

        return;
    }

    clearPnaeForm();

    setPnaeMessage(
        `Passageiro PNAE ${data.passenger_name} cadastrado com sucesso para ${currentCompany?.name || "a empresa selecionada"}.`,
        "success"
    );

    await loadPnaeCalls();
};

window.announcePnaeCall = async id => {
    const { data, error } = await supabase
        .from("pnae_calls")
        .select("*")
        .eq("id", id)
        .eq("company_id", currentCompanyId)
        .maybeSingle();

    if (error || !data) {
        setPnaeMessage("Chamada não encontrada nesta empresa.", "error");
        return;
    }

    speakMultilingualAnnouncement(data);

    const { error: updateError } = await supabase
        .from("pnae_calls")
        .update({
            status: "anunciado",
            announced_at: new Date().toISOString(),
            updated_at: new Date().toISOString()
        })
        .eq("id", id)
        .eq("company_id", currentCompanyId);

    if (updateError) {
        setPnaeMessage(
            "Erro ao marcar chamada como anunciada: " + updateError.message,
            "error"
        );
        return;
    }

    setPnaeMessage("Anúncio realizado em português, inglês e espanhol.", "success");
    loadPnaeCalls();
};

window.repeatPnaeCall = async id => {
    const { data, error } = await supabase
        .from("pnae_calls")
        .select("*")
        .eq("id", id)
        .eq("company_id", currentCompanyId)
        .maybeSingle();

    if (error || !data) {
        setPnaeMessage("Chamada não encontrada nesta empresa.", "error");
        return;
    }

    speakMultilingualAnnouncement(data);
    setPnaeMessage("Anúncio repetido em três idiomas.", "success");
};

window.finishPnaeCall = async id => {
    const { error } = await supabase
        .from("pnae_calls")
        .update({
            status: "concluido",
            updated_at: new Date().toISOString()
        })
        .eq("id", id)
        .eq("company_id", currentCompanyId);

    if (error) {
        setPnaeMessage(
            "Erro ao concluir chamada: " + error.message,
            "error"
        );
        return;
    }

    setPnaeMessage("Chamada concluída.", "success");
    loadPnaeCalls();
};

window.cancelPnaeCall = async id => {
    if (!confirm("Cancelar esta chamada PNAE?")) return;

    const { error } = await supabase
        .from("pnae_calls")
        .update({
            status: "cancelado",
            updated_at: new Date().toISOString()
        })
        .eq("id", id)
        .eq("company_id", currentCompanyId);

    if (error) {
        setPnaeMessage(
            "Erro ao cancelar chamada: " + error.message,
            "error"
        );
        return;
    }

    setPnaeMessage("Chamada cancelada.", "success");
    loadPnaeCalls();
};

async function loadPnaeCalls() {
    const box = document.getElementById("pnaeCalls");

    if (!box) return;

    if (!currentCompanyId) {
        box.innerHTML = "<p>Empresa não identificada. Acesse pelo painel da empresa.</p>";
        return;
    }

    await expireOldPnaeCalls();

    const now = new Date().toISOString();

    const { data, error } = await supabase
        .from("pnae_calls")
        .select("*")
        .eq("company_id", currentCompanyId)
        .gte("departure_time", now)
        .in("status", ["aguardando", "anunciado", "active", "called"])
        .order("departure_time", { ascending: true });

    if (error) {
        console.error("Erro ao carregar chamadas PNAE:", error);
        box.innerHTML = "<p>Erro ao carregar chamadas PNAE.</p>";
        return;
    }

    if (!data || data.length === 0) {
        box.innerHTML = `<p>Nenhum passageiro PNAE ativo para ${esc(currentCompany?.name || "esta empresa")}.</p>`;
        return;
    }

    box.innerHTML = data.map(call => `
        <div class="agent-card pnae-call ${esc(call.status)}">
            <h3>${esc(call.passenger_name)}</h3>

            <p><strong>Empresa:</strong> ${esc(currentCompany?.name || "-")}</p>
            <p><strong>Voo:</strong> ${esc(call.flight_number)}</p>
            <p><strong>Data do voo:</strong> ${esc(formatFlightDate(call.flight_date || call.departure_time))}</p>
            <p><strong>Destino:</strong> ${esc(destinationName(call.destination, "pt"))}</p>
            <p><strong>Decolagem:</strong> ${formatDate(call.departure_time)}</p>
            <p><strong>Assistência:</strong> ${esc(call.assistance_type || "-")}</p>
            <p><strong>Ponto de encontro:</strong> ${esc(call.meeting_point || "-")}</p>
            <p><strong>Status:</strong> ${esc(call.status)}</p>
            <p><strong>Anunciado em:</strong> ${formatDate(call.announced_at)}</p>
            <p><strong>Observações:</strong> ${esc(call.notes || "-")}</p>

            <div class="actions">
                <button onclick="announcePnaeCall('${esc(call.id)}')">Anunciar</button>
                <button onclick="repeatPnaeCall('${esc(call.id)}')">Repetir</button>
                <button onclick="finishPnaeCall('${esc(call.id)}')">Concluir</button>
                <button class="secondary" onclick="cancelPnaeCall('${esc(call.id)}')">Cancelar</button>
            </div>
        </div>
    `).join("");
}

function subscribePnaeCalls() {
    if (!currentCompanyId) return;

    if (pnaeChannel) {
        supabase.removeChannel(pnaeChannel);
    }

    pnaeChannel = supabase
        .channel("pnae_calls_realtime_" + currentCompanyId)
        .on(
            "postgres_changes",
            { event: "*", schema: "public", table: "pnae_calls" },
            payload => {
                const row = payload.new || payload.old || {};

                if (row.company_id === currentCompanyId) {
                    loadPnaeCalls();
                }
            }
        )
        .subscribe();
}

async function initializePnaeAdmin() {
    await resolveCurrentCompany();
    await loadPnaeCalls();
    subscribePnaeCalls();

    setInterval(loadPnaeCalls, 30000);
}

document.addEventListener("DOMContentLoaded", initializePnaeAdmin);