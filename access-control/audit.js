(function () {
  const config = window.LEAL_ACCESS_CONTROL_SUPABASE || {};
  const max = (value, size) => String(value || "").slice(0, size);

  function detectProject() {
    const path = location.pathname.toLowerCase();
    const projectMatch = path.match(/\/(projetos|videos|jogos)\/([^/?#]+)/);
    if (projectMatch && projectMatch[2]) return projectMatch[2];
    if (path.includes("/academy") || path.includes("/leal-academy") || path.includes("/lealacademy")) return "leal-academy";
    if (path.includes("/aero-access")) return "aero-access";
    if (path.includes("/access-control") || path.includes("/controle")) return "access-control";
    return "site-principal";
  }

  function getClient() {
    if (window.supabaseClient) return window.supabaseClient;
    if (!window.supabase || typeof window.supabase.createClient !== "function") return null;
    if (!config.url || !config.key) return null;
    if (!window.__lealAccessControlClient) {
      window.__lealAccessControlClient = window.supabase.createClient(config.url, config.key);
    }
    return window.__lealAccessControlClient;
  }

  async function getUser(client) {
    try {
      if (!client || !client.auth || typeof client.auth.getSession !== "function") return {};
      const { data } = await client.auth.getSession();
      const user = data && data.session && data.session.user;
      return {
        profile_auth_id: user && user.id ? user.id : null,
        user_email: user && user.email ? user.email : null
      };
    } catch (error) {
      return {};
    }
  }

  async function log(event, result, metadata) {
    try {
      const client = getClient();
      if (!client || typeof client.rpc !== "function") return false;

      const user = await getUser(client);
      const payload = {
        project_slug: max(window.LEAL_AUDIT_PROJECT || detectProject(), 120),
        event: max(event || "page_view", 120),
        result: max(result || "Permitido", 40),
        path: max(location.pathname + location.search, 500),
        title: max(document.title, 180),
        referrer: max(document.referrer, 500),
        user_agent: max(navigator.userAgent, 500),
        user_email: user.user_email || null,
        profile_auth_id: user.profile_auth_id || null,
        metadata: metadata || {}
      };

      const { error } = await client.rpc("control_log_event", { payload });
      if (error) console.debug("Leal audit ignorado:", error.message);
      return !error;
    } catch (error) {
      console.debug("Leal audit indisponivel:", error);
      return false;
    }
  }

  window.LealAccessAudit = { log };

  if (!window.LEAL_AUDIT_DISABLE_AUTO) {
    window.addEventListener("load", function () {
      setTimeout(function () {
        log("page_view", "Permitido", { href: location.href });
      }, 600);
    }, { once: true });

    document.addEventListener("click", function (event) {
      const link = event.target.closest && event.target.closest("a");
      if (!link) return;
      const href = link.getAttribute("href") || "";
      const isDownload = link.hasAttribute("download") || /\.(zip|apk|pdf|sql|xlsx?|docx?|pptx?)($|\?)/i.test(href);
      if (!isDownload) return;
      log("download_click", "Permitido", {
        href: link.href,
        text: max(link.textContent.trim(), 120)
      });
    }, true);
  }
})();

