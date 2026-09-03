import { supabase } from "./supabase.js?v=20260903-rpc-login-v2";

const ADMIN_ROLES = [
    "admin",
    "admin_operacional",
    "operational_admin",
    "admin_empresa",
    "company_admin",
    "admin_global",
    "global_admin"
];

function normalizeEmail(email) {
    return (email || "").trim().toLowerCase();
}

function normalizeRole(role) {
    return String(role || "").trim().toLowerCase();
}

function showMessage(element, text) {
    if (element) {
        element.textContent = text;
    }
}

function buildUserSession(profile, fallbackRole, email) {
    return {
        id: profile.id,
        role: normalizeRole(profile.role || fallbackRole),
        name: profile.name || profile.full_name || profile.email || fallbackRole,
        email: profile.email || email
    };
}

async function legacyTableLogin({ table, email, password, activeOnly = false, acceptedRoles = [] }) {
    let query = supabase
        .from(table)
        .select("*")
        .eq("email", email)
        .eq("password", password);

    if (activeOnly) {
        query = query.eq("active", true);
    }

    if (acceptedRoles.length) {
        query = query.in("role", acceptedRoles);
    }

    const { data, error } = await query.maybeSingle();

    if (error) {
        console.error(`Aero Access login error on ${table}:`, error);
        return { profile: null, error };
    }

    return { profile: data || null, error: null };
}

async function rpcLogin(profile, email, password) {
    const { data, error } = await supabase.rpc("aa_login_web", {
        p_profile: profile,
        p_email: email,
        p_password: password
    });

    if (error) {
        console.error("Aero Access RPC login error:", error);
        return { profile: null, error };
    }

    return { profile: data || null, error: null };
}

async function authLogin(email, password) {
    if (!supabase.auth || typeof supabase.auth.signInWithPassword !== "function") {
        return null;
    }

    const { data, error } = await supabase.auth.signInWithPassword({ email, password });

    if (error) {
        return null;
    }

    return data?.user || null;
}

async function findProfile(table, email) {
    const { data, error } = await supabase
        .from(table)
        .select("*")
        .eq("email", email)
        .maybeSingle();

    if (error) {
        console.error(`Aero Access profile lookup error on ${table}:`, error);
        return null;
    }

    return data || null;
}

export function isAdminRole(role) {
    return ADMIN_ROLES.includes(normalizeRole(role));
}

export async function loginPassengerAccount({ email, password, message }) {
    const normalizedEmail = normalizeEmail(email);
    showMessage(message, "");

    if (!normalizedEmail || !password) {
        showMessage(message, "Informe e-mail e senha.");
        return false;
    }

    const rpc = await rpcLogin("passenger", normalizedEmail, password);
    const legacy = rpc.profile ? { profile: null, error: null } : await legacyTableLogin({
        table: "passengers",
        email: normalizedEmail,
        password,
        activeOnly: true
    });

    let passenger = rpc.profile || legacy.profile;

    if (!passenger) {
        const authUser = await authLogin(normalizedEmail, password);
        if (authUser) {
            passenger = await findProfile("passengers", normalizedEmail) || {
                id: authUser.id,
                name: authUser.user_metadata?.name || authUser.email || "Passageiro",
                email: authUser.email || normalizedEmail,
                phone: authUser.user_metadata?.phone || "",
                active: true,
                total_requests: 0
            };
        }
    }

    if (!passenger) {
        showMessage(message, legacy.error
            ? "Login não autorizado pelo banco de dados. Verifique as políticas RLS/tabela passengers no Supabase."
            : "Usuário ou senha inválidos.");
        return false;
    }

    localStorage.removeItem("user");
    localStorage.setItem("passenger", JSON.stringify(passenger));
    location.href = "passenger.html";
    return true;
}

export async function loginAgentAccount({ email, password, message }) {
    const normalizedEmail = normalizeEmail(email);
    showMessage(message, "");

    if (!normalizedEmail || !password) {
        showMessage(message, "Informe e-mail e senha.");
        return false;
    }

    const rpc = await rpcLogin("agent", normalizedEmail, password);
    const legacy = rpc.profile ? { profile: null, error: null } : await legacyTableLogin({
        table: "agents",
        email: normalizedEmail,
        password,
        activeOnly: true
    });

    let profile = rpc.profile || legacy.profile;

    if (!profile) {
        const authUser = await authLogin(normalizedEmail, password);
        if (authUser) {
            profile = await findProfile("agents", normalizedEmail) || {
                id: authUser.id,
                name: authUser.user_metadata?.name || authUser.email || "Agente",
                email: authUser.email || normalizedEmail,
                role: "agent"
            };
        }
    }

    if (!profile) {
        showMessage(message, legacy.error
            ? "Login não autorizado pelo banco de dados. Verifique as políticas RLS/tabela agents no Supabase."
            : "Login inválido.");
        return false;
    }

    await supabase
        .from("agents")
        .update({ last_access: new Date().toISOString() })
        .eq("id", profile.id);

    localStorage.removeItem("passenger");
    localStorage.setItem("user", JSON.stringify(buildUserSession(profile, "agent", normalizedEmail)));
    location.href = "agent.html";
    return true;
}

export async function loginAdminAccount({ email, password, message }) {
    const normalizedEmail = normalizeEmail(email);
    showMessage(message, "");

    if (!normalizedEmail || !password) {
        showMessage(message, "Informe e-mail e senha.");
        return false;
    }

    const rpc = await rpcLogin("admin", normalizedEmail, password);
    let profile = rpc.profile;

    if (!profile && !rpc.error) {
        const legacy = await legacyTableLogin({
            table: "users",
            email: normalizedEmail,
            password,
            acceptedRoles: ADMIN_ROLES
        });

        profile = legacy.profile;

        if (!profile && legacy.error) {
            showMessage(message, "Login não autorizado pelo banco de dados. Verifique as políticas RLS/tabela users no Supabase.");
            return false;
        }
    }

    if (!profile && !rpc.error) {
        const authUser = await authLogin(normalizedEmail, password);
        if (authUser) {
            profile = await findProfile("users", normalizedEmail) || {
                id: authUser.id,
                name: authUser.user_metadata?.name || authUser.email || "Administrador",
                email: authUser.email || normalizedEmail,
                role: authUser.user_metadata?.role || "admin_operacional"
            };
        }
    }

    if (!profile) {
        showMessage(message, rpc.error
            ? "Erro na função aa_login_web. Execute o SQL completo novamente e aguarde o schema cache do Supabase atualizar."
            : "Login inválido.");
        return false;
    }

    if (!isAdminRole(profile.role || "admin_operacional")) {
        showMessage(message, "A conta informada não possui perfil administrativo.");
        return false;
    }

    localStorage.removeItem("passenger");
    localStorage.setItem("user", JSON.stringify(buildUserSession(profile, "admin_operacional", normalizedEmail)));
    location.href = "admin.html";
    return true;
}

