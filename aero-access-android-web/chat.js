import { supabase } from "./supabase.js";

const params = new URLSearchParams(window.location.search);
const requestId = params.get("request") || localStorage.getItem("currentRequest");

const container = document.getElementById("chatMessages");
const input = document.getElementById("messageInput");
const alertBox = document.getElementById("chatAlert");
const sound = document.getElementById("chatSound");

const passenger = JSON.parse(localStorage.getItem("passenger") || "null");
const user = JSON.parse(localStorage.getItem("user") || "null");

let currentUser = null;
let firstLoadFinished = false;
let unreadCount = 0;
let knownMessageIds = new Set();
let isWindowFocused = true;

if (passenger) {
    currentUser = {
        type: "passenger",
        name: passenger.name || passenger.email || "Passageiro"
    };
} else if (user) {
    currentUser = {
        type: user.role === "admin" ? "admin" : "agent",
        name: user.name || user.email || "Agente"
    };
}

function showSystemMessage(message) {
    container.innerHTML = "";

    const div = document.createElement("div");
    div.className = "system-message";
    div.textContent = message;

    container.appendChild(div);
}

function appendMessage(msg) {
    const senderType = msg.sender_type === "agent" ? "agent" : "passenger";

    const div = document.createElement("div");
    div.className = senderType;

    const strong = document.createElement("strong");
    strong.textContent = msg.sender_name || "-";

    const text = document.createElement("div");
    text.textContent = msg.message || "";

    div.appendChild(strong);
    div.appendChild(text);

    container.appendChild(div);
}

function isOwnMessage(msg) {
    if (!currentUser || !msg) return false;

    const currentType =
        currentUser.type === "admin"
            ? "agent"
            : currentUser.type;

    return (
        msg.sender_type === currentType &&
        msg.sender_name === currentUser.name
    );
}

function playAlertSound() {
    if (!sound) return;

    try {
        sound.currentTime = 0;
        sound.play().catch(() => {});
    } catch (_) {}
}

function showChatAlert(msg) {
    unreadCount += 1;

    if (alertBox) {
        alertBox.style.display = "block";
        alertBox.innerHTML = `
            Nova mensagem de <strong>${msg.sender_name || "usuario"}</strong>
            <span class="unread-chat-badge">${unreadCount}</span>
        `;
    }

    document.title = `(${unreadCount}) Chat Aero Access`;

    if (navigator.vibrate) {
        navigator.vibrate([180, 80, 180]);
    }

    playAlertSound();
}

function clearChatAlert() {
    unreadCount = 0;

    if (alertBox) {
        alertBox.style.display = "none";
        alertBox.textContent = "";
    }

    document.title = "Chat Aero Access";
}

async function validateAccess() {
    if (!requestId) return false;

    let query = supabase
        .from("requests")
        .select("*")
        .eq("id", requestId);

    if (passenger) {
        query = query.eq("passenger_email", passenger.email);
    } else if (user && user.role === "agent") {
        query = query.eq("agent_id", user.id);
    } else if (user && user.role === "admin") {
        // Admin pode ver todos.
    } else {
        return false;
    }

    const { data, error } = await query.maybeSingle();

    if (error || !data) return false;

    localStorage.setItem("currentRequest", requestId);
    return true;
}

async function fetchMessages() {
    const { data, error } = await supabase
        .from("messages")
        .select("*")
        .eq("request_id", requestId)
        .order("created_at", { ascending: true });

    if (error) {
        throw error;
    }

    return data || [];
}

function renderMessages(messages) {
    container.innerHTML = "";

    if (!messages || messages.length === 0) {
        showSystemMessage("Nenhuma mensagem ainda.");
        return;
    }

    messages.forEach(appendMessage);
    container.scrollTop = container.scrollHeight;
}

function detectNewIncomingMessages(messages) {
    if (!firstLoadFinished) return;

    const newIncoming = messages.filter(msg =>
        !knownMessageIds.has(msg.id) &&
        !isOwnMessage(msg)
    );

    if (newIncoming.length > 0) {
        showChatAlert(newIncoming[newIncoming.length - 1]);
    }
}

function updateKnownMessages(messages) {
    knownMessageIds = new Set(messages.map(msg => msg.id));
}

async function loadMessages({ checkAlerts = false } = {}) {
    const allowed = await validateAccess();

    if (!allowed) {
        showSystemMessage("Voce nao tem acesso a este chat.");
        if (input) input.disabled = true;
        return;
    }

    try {
        const messages = await fetchMessages();

        if (checkAlerts) {
            detectNewIncomingMessages(messages);
        }

        renderMessages(messages);
        updateKnownMessages(messages);
        firstLoadFinished = true;

    } catch (error) {
        console.error("Erro ao carregar mensagens:", error);
        showSystemMessage("Nao foi possivel carregar as mensagens.");
    }
}

window.sendMessage = async () => {
    if (!currentUser) {
        alert("Faca login novamente.");
        location.href = "index.html";
        return;
    }

    const allowed = await validateAccess();

    if (!allowed) {
        alert("Voce nao tem acesso a este chat.");
        return;
    }

    const message = input.value.trim();

    if (!message) return;

    input.disabled = true;

    const { error } = await supabase
        .from("messages")
        .insert([{
            request_id: requestId,
            sender_type: currentUser.type === "admin" ? "agent" : currentUser.type,
            sender_name: currentUser.name,
            message
        }]);

    input.disabled = false;
    input.focus();

    if (error) {
        alert("Nao foi possivel enviar a mensagem.");
        return;
    }

    input.value = "";
    clearChatAlert();

    await loadMessages({ checkAlerts: false });
};

if (input) {
    input.addEventListener("focus", clearChatAlert);

    input.addEventListener("keydown", event => {
        if (event.key === "Enter") {
            event.preventDefault();
            window.sendMessage();
        }
    });
}

window.addEventListener("focus", () => {
    isWindowFocused = true;
});

window.addEventListener("blur", () => {
    isWindowFocused = false;
});

document.addEventListener("visibilitychange", () => {
    isWindowFocused = !document.hidden;
});

async function startRealtime() {
    const allowed = await validateAccess();

    if (!allowed || !requestId) return;

    supabase
        .channel("chat_alert_" + requestId)
        .on(
            "postgres_changes",
            {
                event: "INSERT",
                schema: "public",
                table: "messages",
                filter: `request_id=eq.${requestId}`
            },
            async payload => {
                const msg = payload.new;

                if (
                    firstLoadFinished &&
                    msg &&
                    !knownMessageIds.has(msg.id) &&
                    !isOwnMessage(msg)
                ) {
                    showChatAlert(msg);
                }

                await loadMessages({ checkAlerts: false });
            }
        )
        .subscribe(status => {
            console.log("CHAT REALTIME STATUS:", status);
        });
}

function startPollingFallback() {
    setInterval(() => {
        loadMessages({ checkAlerts: true });
    }, 4000);
}

await loadMessages({ checkAlerts: false });
startRealtime();
startPollingFallback();