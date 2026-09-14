const STORAGE_KEY = "leal_access_control_v1";

const seed = {
  projects: [
    { id: "portfolio", slug: "portfolio", name: "Portfólio DevLeal2026", type: "Site", url: "https://devleal2026.lealacademy.com.br/", status: "Ativo" },
    { id: "leal-academy", slug: "leal-academy", name: "Leal Academy", type: "Plataforma", url: "https://www.lealacademy.com.br/", status: "Ativo" },
    { id: "aero-access", slug: "aero-access", name: "Aero Access", type: "Aplicativo", url: "https://aeroaccess.lealacademy.com.br/", status: "Ativo" },
    { id: "access-control", slug: "access-control", name: "Painel de Controle", type: "Painel", url: "https://www.lealacademy.com.br/controle", status: "Ativo" },
    { id: "sistema-achados-perdidos", slug: "sistema-achados-perdidos", name: "Sistema de Achados e Perdidos", type: "Aplicativo", url: "https://devleal2026.lealacademy.com.br/projetos/sistema-achados-perdidos/", status: "Ativo" },
    { id: "quadroo", slug: "quadroo", name: "Quadroo", type: "Aplicativo", url: "https://devleal2026.lealacademy.com.br/projetos/quadroo/", status: "Ativo" },
    { id: "neuroloop", slug: "neuroloop", name: "NeuroLoop", type: "Jogo", url: "https://devleal2026.lealacademy.com.br/projetos/neuroloop/", status: "Ativo" },
    { id: "adivinhe-o-animal", slug: "adivinhe-o-animal", name: "Adivinhe o Animal", type: "Jogo", url: "https://devleal2026.lealacademy.com.br/projetos/adivinhe-o-animal/", status: "Ativo" },
    { id: "insect-hunter", slug: "insect-hunter", name: "Insect Hunter", type: "Jogo", url: "https://devleal2026.lealacademy.com.br/projetos/insect-hunter/", status: "Ativo" },
    { id: "construindo-palavras", slug: "construindo-palavras", name: "Construindo Palavras", type: "Jogo educativo", url: "https://devleal2026.lealacademy.com.br/projetos/construindo-palavras/", status: "Ativo" },
    { id: "avisou", slug: "avisou", name: "AvisoU", type: "Aplicativo", url: "https://devleal2026.lealacademy.com.br/projetos/avisou/", status: "Ativo" },
    { id: "mibis", slug: "mibis", name: "Mibis", type: "Jogo", url: "https://devleal2026.lealacademy.com.br/projetos/mibis/", status: "Ativo" },
    { id: "laura-lara-aventura", slug: "laura-lara-aventura", name: "Laura & Lara - A Grande Missão Sapeca", type: "Jogo educativo", url: "https://devleal2026.lealacademy.com.br/projetos/laura-lara-aventura/", status: "Ativo" },
    { id: "alf", slug: "alf", name: "ALF - Bagagens Extraviadas", type: "Vídeo operacional", url: "https://devleal2026.lealacademy.com.br/videos/alf/", status: "Ativo" },
    { id: "airport-baggage-simulator", slug: "airport-baggage-simulator", name: "Airport Baggage Simulator", type: "Simulador", url: "https://devleal2026.lealacademy.com.br/videos/airport-baggage-simulator/", status: "Ativo" }
  ],  users: [
    { id: "u-admin", name: "Administrador geral", email: "devleal2026@gmail.com", role: "Admin global", status: "Ativo" },
    { id: "u-suporte", name: "Suporte operacional", email: "suporte@lealacademy.com.br", role: "Admin do projeto", status: "Pendente" }
  ],
  permissions: [
    { userId: "u-admin", projectId: "leal-academy", access: "Administrar" },
    { userId: "u-admin", projectId: "aero-access", access: "Administrar" },
    { userId: "u-admin", projectId: "access-control", access: "Administrar" }
  ],
  logs: [
    { date: new Date().toISOString(), userId: "u-admin", userEmail: "devleal2026@gmail.com", projectId: "access-control", event: "Painel carregado", result: "Permitido" }
  ]
};

let state = loadState();
let remoteReady = false;
let remoteMessage = "Modo local ativo. Execute o SQL do painel para ativar logs reais no Supabase.";

function mergeSeed(stored) {
  const merged = stored && typeof stored === "object" ? stored : structuredClone(seed);
  merged.projects = Array.isArray(merged.projects) ? merged.projects : [];
  merged.users = Array.isArray(merged.users) ? merged.users : [];
  merged.permissions = Array.isArray(merged.permissions) ? merged.permissions : [];
  merged.logs = Array.isArray(merged.logs) ? merged.logs : [];

  seed.projects.forEach((project) => {
    if (!merged.projects.some((item) => item.id === project.id || item.slug === project.slug)) {
      merged.projects.push(project);
    }
  });
  seed.users.forEach((user) => {
    if (!merged.users.some((item) => item.id === user.id || item.email === user.email)) {
      merged.users.push(user);
    }
  });
  seed.permissions.forEach((permission) => {
    if (!merged.permissions.some((item) => item.userId === permission.userId && item.projectId === permission.projectId)) {
      merged.permissions.push(permission);
    }
  });
  return merged;
}

function loadState() {
  try {
    const stored = localStorage.getItem(STORAGE_KEY);
    return stored ? mergeSeed(JSON.parse(stored)) : structuredClone(seed);
  } catch (error) {
    return structuredClone(seed);
  }
}

function saveState() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
}

function uid(prefix) {
  return `${prefix}-${Date.now()}-${Math.random().toString(16).slice(2, 8)}`;
}

function byId(list, id) {
  return list.find((item) => item.id === id || item.slug === id);
}

function escapeHtml(value) {
  return String(value ?? "").replace(/[&<>'"]/g, (char) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", "'": "&#39;", '"': "&quot;" }[char]));
}

function statusBadge(status) {
  const label = escapeHtml(status || "");
  const n = label.toLowerCase();
  let cls = "";
  if (n.includes("ativo") || n.includes("permitido")) cls = "ok";
  if (n.includes("revis") || n.includes("pendente") || n.includes("somente")) cls = "warn";
  if (n.includes("bloqueado") || n.includes("negado")) cls = "blocked";
  return `<span class="badge ${cls}">${label}</span>`;
}

function getControlClient() {
  const config = window.LEAL_ACCESS_CONTROL_SUPABASE || {};
  if (window.__lealAccessControlClient) return window.__lealAccessControlClient;
  if (!window.supabase || typeof window.supabase.createClient !== "function") return null;
  if (!config.url || !config.key) return null;
  window.__lealAccessControlClient = window.supabase.createClient(config.url, config.key);
  return window.__lealAccessControlClient;
}

function setRemoteStatus(ok, message) {
  remoteReady = ok;
  remoteMessage = message;
  const card = document.querySelector(".status-card");
  if (!card) return;
  card.querySelector("strong").textContent = ok ? "Supabase conectado" : "Modo local seguro";
  card.querySelector("small").textContent = message;
  card.classList.toggle("online", ok);
}

function normalizeRemote(data) {
  const projects = (data.projects || []).map((p) => ({
    id: p.id,
    slug: p.slug,
    name: p.name,
    type: p.type,
    url: p.url || "",
    status: p.status || "Ativo"
  }));
  const users = (data.users || []).map((u) => ({
    id: u.id,
    name: u.name,
    email: u.email,
    role: u.role || "Visitante",
    status: u.status || "Ativo"
  }));
  const permissions = (data.permissions || []).map((p) => ({
    userId: p.profile_id,
    projectId: p.project_id,
    access: p.access_level || "Visualizar"
  }));
  const logs = (data.logs || []).map((log) => ({
    date: log.created_at,
    userId: log.profile_id || "remote-user",
    userEmail: log.user_email || "visitante sem login",
    projectId: log.project_id || log.project_slug || "site-principal",
    projectSlug: log.project_slug,
    event: log.event,
    result: log.result,
    path: log.path || ""
  }));
  return { projects, users, permissions, logs };
}

async function syncFromSupabase() {
  const client = getControlClient();
  if (!client) {
    setRemoteStatus(false, "Supabase indisponível nesta página. O painel continua funcionando em modo local.");
    return;
  }

  try {
    const [projectsRes, usersRes, permissionsRes, logsRes] = await Promise.all([
      client.from("control_projects").select("id,slug,name,type,url,status").order("name", { ascending: true }),
      client.from("control_profiles").select("id,name,email,role,status").order("name", { ascending: true }),
      client.from("control_project_access").select("profile_id,project_id,access_level"),
      client.from("control_access_logs").select("id,profile_id,project_id,project_slug,user_email,event,result,path,created_at").order("created_at", { ascending: false }).limit(100)
    ]);

    const error = projectsRes.error || usersRes.error || permissionsRes.error || logsRes.error;
    if (error) throw error;

    const remoteState = normalizeRemote({
      projects: projectsRes.data,
      users: usersRes.data,
      permissions: permissionsRes.data,
      logs: logsRes.data
    });

    const mergedRemote = mergeSeed({
      projects: remoteState.projects.length ? remoteState.projects : state.projects,
      users: remoteState.users.length ? remoteState.users : state.users,
      permissions: remoteState.permissions.length ? remoteState.permissions : state.permissions,
      logs: remoteState.logs.length ? remoteState.logs : state.logs
    });

    state = {
      projects: mergedRemote.projects,
      users: mergedRemote.users,
      permissions: mergedRemote.permissions,
      logs: mergedRemote.logs
    };

    setRemoteStatus(true, "Logs reais ativos. Acessos e downloads registrados pelo Supabase quando o SQL estiver executado.");
  } catch (error) {
    setRemoteStatus(false, `Execute/atualize o SQL do painel no Supabase para ativar os logs reais. Detalhe: ${error.message}`);
  }
}

async function recordAudit(event, result, metadata = {}) {
  const user = state.users[0] || seed.users[0];
  const project = state.projects[0] || seed.projects[0];
  state.logs.unshift({
    date: new Date().toISOString(),
    userId: user.id,
    userEmail: user.email,
    projectId: project.id,
    event,
    result
  });

  if (window.LealAccessAudit && typeof window.LealAccessAudit.log === "function") {
    await window.LealAccessAudit.log(event, result, metadata);
  }
}

function projectName(id, slug) {
  const project = byId(state.projects, id) || byId(state.projects, slug);
  return project ? project.name : (slug || "Projeto não identificado");
}

function getProjectAccessStats() {
  const stats = new Map();
  state.projects.forEach((project) => {
    stats.set(project.id, {
      project,
      total: 0,
      users: new Set(),
      lastDate: null
    });
  });

  state.logs.forEach((log) => {
    const project = byId(state.projects, log.projectId) || byId(state.projects, log.projectSlug);
    const key = project ? project.id : (log.projectSlug || log.projectId || "site-principal");
    if (!stats.has(key)) {
      stats.set(key, {
        project: { id: key, slug: key, name: projectName(log.projectId, log.projectSlug), type: "Projeto", status: "Ativo" },
        total: 0,
        users: new Set(),
        lastDate: null
      });
    }
    const item = stats.get(key);
    item.total += 1;
    item.users.add(log.userEmail || byId(state.users, log.userId)?.email || "visitante sem login");
    const date = new Date(log.date);
    if (!item.lastDate || date > item.lastDate) item.lastDate = date;
  });

  return Array.from(stats.values()).sort((a, b) => b.total - a.total || a.project.name.localeCompare(b.project.name, "pt-BR"));
}

function renderProjectAccessSummary() {
  const target = document.querySelector("#projectAccessSummary");
  if (!target) return;
  target.innerHTML = getProjectAccessStats().map((item) => {
    const users = Array.from(item.users).slice(0, 4);
    const usersLabel = users.length ? users.join(", ") : "Sem acessos registrados";
    const more = item.users.size > 4 ? ` +${item.users.size - 4}` : "";
    return `
      <tr>
        <td><strong>${escapeHtml(item.project.name)}</strong><br><small class="muted">${escapeHtml(item.project.slug || item.project.id)}</small></td>
        <td><strong>${item.total}</strong></td>
        <td>${escapeHtml(usersLabel)}${escapeHtml(more)}</td>
        <td>${item.lastDate ? item.lastDate.toLocaleString("pt-BR") : "Ainda sem registro"}</td>
      </tr>`;
  }).join("");
}
function renderMetrics() {
  const activeProjects = state.projects.filter((p) => p.status === "Ativo").length;
  const activeUsers = state.users.filter((u) => u.status === "Ativo").length;
  const deniedLogs = state.logs.filter((log) => log.result === "Negado").length;
  document.querySelector("#metrics").innerHTML = [
    ["Projetos", state.projects.length],
    ["Projetos ativos", activeProjects],
    ["Usuários ativos", activeUsers],
    ["Acessos negados", deniedLogs]
  ].map(([label, value]) => `<article class="metric"><span>${label}</span><strong>${value}</strong></article>`).join("");
}

function renderDashboard() {
  document.querySelector("#dashboardProjects").innerHTML = state.projects.map((project) => `
    <tr>
      <td><strong>${escapeHtml(project.name)}</strong></td>
      <td>${escapeHtml(project.type)}</td>
      <td>${statusBadge(project.status)}</td>
      <td>${project.url ? `<a href="${escapeHtml(project.url)}" target="_blank" rel="noreferrer">Abrir</a>` : `<span class="muted">Sem URL</span>`}</td>
    </tr>`).join("");

  document.querySelector("#dashboardLogs").innerHTML = state.logs.slice(0, 8).map((log) => `
    <article class="log-item">
      <strong>${escapeHtml(log.event)}</strong>
      <small>${escapeHtml(log.userEmail || byId(state.users, log.userId)?.email || "visitante")} · ${escapeHtml(projectName(log.projectId, log.projectSlug))}</small><br>
      <small>${new Date(log.date).toLocaleString("pt-BR")} · ${statusBadge(log.result)}</small>
    </article>`).join("");
}

function renderProjects() {
  document.querySelector("#projectCards").innerHTML = state.projects.map((project) => `
    <article class="project-card">
      <header><div><strong>${escapeHtml(project.name)}</strong><p class="muted">${escapeHtml(project.type)}</p></div>${statusBadge(project.status)}</header>
      <p>${project.url ? `<a href="${escapeHtml(project.url)}" target="_blank" rel="noreferrer">${escapeHtml(project.url)}</a>` : "Sem URL cadastrada."}</p>
      <div class="row-actions"><button type="button" data-remove-project="${escapeHtml(project.id)}">Remover</button></div>
    </article>`).join("");
}

function renderUsers() {
  document.querySelector("#userRows").innerHTML = state.users.map((user) => `
    <tr>
      <td><strong>${escapeHtml(user.name)}</strong></td><td>${escapeHtml(user.email)}</td><td>${escapeHtml(user.role)}</td><td>${statusBadge(user.status)}</td>
      <td><div class="row-actions"><button type="button" data-toggle-user="${escapeHtml(user.id)}">${user.status === "Bloqueado" ? "Ativar" : "Bloquear"}</button><button type="button" data-remove-user="${escapeHtml(user.id)}">Remover</button></div></td>
    </tr>`).join("");
}

function renderPermissionSelects() {
  document.querySelector("#permissionUser").innerHTML = state.users.map((user) => `<option value="${escapeHtml(user.id)}">${escapeHtml(user.name)} · ${escapeHtml(user.email)}</option>`).join("");
  document.querySelector("#permissionProject").innerHTML = state.projects.map((project) => `<option value="${escapeHtml(project.id)}">${escapeHtml(project.name)}</option>`).join("");
}

function renderPermissions() {
  renderPermissionSelects();
  document.querySelector("#permissionsGrid").innerHTML = state.permissions.map((permission) => {
    const user = byId(state.users, permission.userId);
    return `
      <article class="permission-card">
        <header><strong>${escapeHtml(projectName(permission.projectId))}</strong>${statusBadge(permission.access)}</header>
        <p>${escapeHtml(user?.name || "Usuário removido")}</p>
        <p class="muted">${escapeHtml(user?.email || "")}</p>
        <div class="row-actions"><button type="button" data-remove-permission="${escapeHtml(permission.userId)}|${escapeHtml(permission.projectId)}">Remover</button></div>
      </article>`;
  }).join("");
}

function renderLogs() {
  document.querySelector("#logRows").innerHTML = state.logs.map((log) => `
    <tr>
      <td>${new Date(log.date).toLocaleString("pt-BR")}</td>
      <td>${escapeHtml(log.userEmail || byId(state.users, log.userId)?.email || "visitante")}</td>
      <td>${escapeHtml(projectName(log.projectId, log.projectSlug))}</td>
      <td>${escapeHtml(log.event)}${log.path ? `<br><small class="muted">${escapeHtml(log.path)}</small>` : ""}</td>
      <td>${statusBadge(log.result)}</td>
    </tr>`).join("");
}

function renderAll() {
  renderMetrics();
  renderDashboard();
  renderProjects();
  renderUsers();
  renderPermissions();
  renderLogs();
  renderProjectAccessSummary();
  saveState();
}

document.querySelectorAll(".nav-item").forEach((button) => {
  button.addEventListener("click", () => {
    document.querySelectorAll(".nav-item").forEach((item) => item.classList.remove("active"));
    document.querySelectorAll(".view").forEach((view) => view.classList.remove("active"));
    button.classList.add("active");
    document.querySelector(`#${button.dataset.view}`).classList.add("active");
  });
});

document.querySelector("#projectForm").addEventListener("submit", async (event) => {
  event.preventDefault();
  const data = Object.fromEntries(new FormData(event.currentTarget));
  state.projects.unshift({ id: uid("p"), slug: data.name.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, ""), ...data });
  await recordAudit("Projeto cadastrado", "Permitido", { project: data.name });
  event.currentTarget.reset();
  renderAll();
});

document.querySelector("#userForm").addEventListener("submit", async (event) => {
  event.preventDefault();
  const data = Object.fromEntries(new FormData(event.currentTarget));
  state.users.unshift({ id: uid("u"), ...data });
  await recordAudit("Usuário cadastrado", "Permitido", { email: data.email });
  event.currentTarget.reset();
  renderAll();
});

document.querySelector("#permissionForm").addEventListener("submit", async (event) => {
  event.preventDefault();
  const data = Object.fromEntries(new FormData(event.currentTarget));
  const existing = state.permissions.find((item) => item.userId === data.userId && item.projectId === data.projectId);
  if (existing) existing.access = data.access;
  else state.permissions.unshift(data);
  await recordAudit("Permissão atualizada", data.access === "Bloqueado" ? "Negado" : "Permitido", data);
  renderAll();
});

document.body.addEventListener("click", async (event) => {
  const projectId = event.target.dataset.removeProject;
  const userId = event.target.dataset.removeUser;
  const toggleUser = event.target.dataset.toggleUser;
  const permissionKey = event.target.dataset.removePermission;
  if (projectId) {
    state.projects = state.projects.filter((project) => project.id !== projectId);
    state.permissions = state.permissions.filter((permission) => permission.projectId !== projectId);
    await recordAudit("Projeto removido", "Permitido", { projectId });
  }
  if (userId) {
    state.users = state.users.filter((user) => user.id !== userId);
    state.permissions = state.permissions.filter((permission) => permission.userId !== userId);
    await recordAudit("Usuário removido", "Permitido", { userId });
  }
  if (toggleUser) {
    const user = byId(state.users, toggleUser);
    if (user) user.status = user.status === "Bloqueado" ? "Ativo" : "Bloqueado";
    await recordAudit("Status de usuário alterado", user?.status === "Bloqueado" ? "Negado" : "Permitido", { userId: toggleUser });
  }
  if (permissionKey) {
    const [u, p] = permissionKey.split("|");
    state.permissions = state.permissions.filter((permission) => !(permission.userId === u && permission.projectId === p));
    await recordAudit("Permissão removida", "Permitido", { userId: u, projectId: p });
  }
  if (projectId || userId || toggleUser || permissionKey) renderAll();
});

document.querySelector("#addLog").addEventListener("click", async () => {
  await recordAudit("Acesso manual registrado", "Permitido", { origin: "panel" });
  await syncFromSupabase();
  renderAll();
});

document.querySelector("#exportData").addEventListener("click", () => {
  const blob = new Blob([JSON.stringify({ remoteReady, remoteMessage, ...state }, null, 2)], { type: "application/json" });
  const link = document.createElement("a");
  link.href = URL.createObjectURL(blob);
  link.download = `controle-acessos-${new Date().toISOString().slice(0, 10)}.json`;
  link.click();
  URL.revokeObjectURL(link.href);
});

(async function init() {
  renderAll();
  await syncFromSupabase();
  renderAll();
})();




