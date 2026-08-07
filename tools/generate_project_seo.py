from __future__ import annotations

import html
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BASE = "https://devleal2026-web.github.io/portfolio-marcos-leal"
VERIFY = "HJ8K8C9tw1Pk2vYhzlsIoNYQVJHJviNGZB7VuuIisPc"

SLUGS = {
    "Sistema de Achados e Perdidos": "sistema-achados-perdidos",
    "Quadroo": "quadroo",
    "Neuro Loop": "neuroloop",
    "Adivinhe o Animal": "adivinhe-o-animal",
    "Insect Hunter": "insect-hunter",
    "Construindo Palavras": "construindo-palavras",
    "AvisoU": "avisou",
    "Aero Access": "aero-access",
    "Mibis": "mibis",
    "Laura & Lara - A Grande Missão Sapeca": "laura-lara-aventura",
}

VIDEO_SLUGS = {
    "Sistema de Achados e Perdidos": "encontre-facil",
    "Neuro Loop": "neuroloop",
    "Construindo Palavras": "construindo-palavras",
    "AvisoU": "avisou",
    "Aero Access": "aero-access",
    "Mibis": "mibis",
    "Laura & Lara - A Grande Missão Sapeca": "laura-lara-aventura",
}


def project_page(project: dict[str, str], slug: str) -> str:
    title = project["titulo"]
    description = project["descricao"]
    technologies = project["tecnologias"]
    canonical = f"{BASE}/projetos/{slug}/"
    image_url = f"{BASE}/{project['imagem']}"
    app_type = "GameApplication" if "Jogo" in description or "Game Design" in technologies else "SoftwareApplication"
    schema: dict[str, object] = {
        "@context": "https://schema.org",
        "@type": app_type,
        "name": title,
        "description": description,
        "url": canonical,
        "image": image_url,
        "applicationCategory": "DeveloperApplication",
        "operatingSystem": "Android" if "Android" in technologies else "Web",
        "author": {
            "@type": "Person",
            "name": "Marcos Antonio de Sousa Leal",
            "url": f"{BASE}/",
        },
        "keywords": [part.strip() for part in technologies.split("•")],
        "inLanguage": "pt-BR",
    }
    if project.get("apk"):
        schema["downloadUrl"] = f"{BASE}/{project['apk']}"

    json_ld = json.dumps(schema, ensure_ascii=False, indent=8).replace("</", "<\\/")
    image_path = "../../" + project["imagem"]
    download = ""
    if project.get("apk"):
        download = f'<a class="button" href="../../{html.escape(project["apk"], quote=True)}" download>Baixar APK</a>'
    video = ""
    if title in VIDEO_SLUGS:
        video = f'<a class="button secondary" href="../../videos/{VIDEO_SLUGS[title]}/">Assistir ao filme promocional</a>'

    return f"""<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{html.escape(title)} | Projeto DevLeal2026</title>
    <meta name="description" content="{html.escape(description, quote=True)} Conheça este projeto desenvolvido por Marcos Leal no portfólio DevLeal2026.">
    <meta name="author" content="Marcos Antonio de Sousa Leal">
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <meta name="google-site-verification" content="{VERIFY}">
    <link rel="canonical" href="{canonical}">
    <link rel="alternate" hreflang="pt-BR" href="{canonical}">
    <link rel="alternate" hreflang="x-default" href="{canonical}">
    <link rel="icon" href="../../logo.png" type="image/png">
    <meta property="og:type" content="website">
    <meta property="og:locale" content="pt_BR">
    <meta property="og:site_name" content="DevLeal2026">
    <meta property="og:title" content="{html.escape(title, quote=True)} | Projeto DevLeal2026">
    <meta property="og:description" content="{html.escape(description, quote=True)}">
    <meta property="og:url" content="{canonical}">
    <meta property="og:image" content="{image_url}">
    <script type="application/ld+json">
{json_ld}
    </script>
    <style>
        :root {{ color-scheme:dark; --cyan:#22d3ee; --blue:#2563eb; --text:#f8fafc; --muted:#cbd5e1; }}
        * {{ box-sizing:border-box; }}
        body {{ margin:0; min-height:100vh; font-family:Inter,Segoe UI,Arial,sans-serif; color:var(--text); background:radial-gradient(circle at 75% 10%,#173b67 0,transparent 34%),#07111f; }}
        header,main,footer {{ width:min(1120px,calc(100% - 32px)); margin:auto; }}
        header {{ display:flex; align-items:center; justify-content:space-between; padding:24px 0; gap:20px; }}
        .brand {{ color:var(--text); text-decoration:none; font-weight:800; letter-spacing:.04em; }}
        .back {{ color:var(--cyan); text-decoration:none; font-weight:700; }}
        main {{ padding:42px 0 70px; }}
        .tag {{ display:inline-block; color:var(--cyan); font-weight:800; letter-spacing:.12em; text-transform:uppercase; font-size:.78rem; }}
        h1 {{ margin:.55rem 0 .8rem; font-size:clamp(2.1rem,5vw,4rem); line-height:1.05; }}
        .lead {{ max-width:800px; color:var(--muted); font-size:clamp(1rem,2vw,1.2rem); line-height:1.7; }}
        .project {{ margin-top:30px; display:grid; grid-template-columns:minmax(0,1.1fr) minmax(280px,.9fr); gap:28px; padding:clamp(16px,3vw,28px); border:1px solid #2a4568; border-radius:22px; background:#0d1b2f; box-shadow:0 28px 80px #0008; }}
        .project img {{ width:100%; max-height:560px; object-fit:contain; border-radius:14px; background:#08111f; }}
        .details {{ align-self:center; }}
        .details h2 {{ font-size:1.2rem; }}
        .details p {{ color:var(--muted); line-height:1.7; }}
        .actions {{ display:flex; flex-wrap:wrap; gap:12px; margin-top:22px; }}
        .button {{ display:inline-flex; padding:12px 18px; border-radius:999px; color:white; background:linear-gradient(135deg,var(--blue),#0891b2); text-decoration:none; font-weight:800; }}
        .button.secondary {{ background:#172a45; border:1px solid #365579; }}
        footer {{ padding:24px 0 42px; color:var(--muted); border-top:1px solid #233956; }}
        footer a {{ color:var(--cyan); }}
        @media(max-width:760px) {{ .project {{ grid-template-columns:1fr; }} }}
    </style>
</head>
<body>
    <header>
        <a class="brand" href="../../">DEVLEAL2026</a>
        <a class="back" href="../../#projetos-area">← Todos os projetos</a>
    </header>
    <main>
        <span class="tag">Projeto DevLeal2026</span>
        <h1>{html.escape(title)}</h1>
        <p class="lead">{html.escape(description)}</p>
        <article class="project">
            <img src="{html.escape(image_path, quote=True)}" alt="Tela do projeto {html.escape(title, quote=True)}" loading="eager">
            <div class="details">
                <h2>Tecnologias e especialidades</h2>
                <p>{html.escape(technologies)}</p>
                <p>Projeto desenvolvido por Marcos Leal e apresentado no portfólio DevLeal2026.</p>
                <div class="actions">
                    {download}
                    {video}
                    <a class="button secondary" href="mailto:devleal2026@gmail.com">Entre em contato</a>
                </div>
            </div>
        </article>
    </main>
    <footer>DevLeal2026 · WhatsApp: <a href="https://wa.me/5511950436161">+55 11 95043-6161</a> · E-mail: <a href="mailto:devleal2026@gmail.com">devleal2026@gmail.com</a></footer>
</body>
</html>
"""


def main() -> None:
    catalog_path = ROOT / "projetos" / "projetos.json"
    projects = json.loads(catalog_path.read_text(encoding="utf-8"))
    for project in projects:
        slug = SLUGS[project["titulo"]]
        project["pagina"] = f"projetos/{slug}/"
        target = ROOT / "projetos" / slug
        target.mkdir(parents=True, exist_ok=True)
        (target / "index.html").write_text(project_page(project, slug), encoding="utf-8", newline="\n")

    catalog_path.write_text(json.dumps(projects, ensure_ascii=False, indent=2) + "\n", encoding="utf-8", newline="\n")

    entries = []
    for project in projects:
        slug = SLUGS[project["titulo"]]
        entries.append(
            "  <url>\n"
            f"    <loc>{BASE}/projetos/{slug}/</loc>\n"
            "    <lastmod>2026-08-07</lastmod>\n"
            "    <changefreq>monthly</changefreq>\n"
            "    <priority>0.8</priority>\n"
            "  </url>"
        )
    sitemap = '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n' + "\n".join(entries) + "\n</urlset>\n"
    (ROOT / "project-sitemap.xml").write_text(sitemap, encoding="utf-8", newline="\n")

    main_sitemap_path = ROOT / "sitemap.xml"
    main_sitemap = main_sitemap_path.read_text(encoding="utf-8")
    if f"{BASE}/projetos/" not in main_sitemap:
        project_urls = "\n".join(entries) + "\n"
        main_sitemap = main_sitemap.replace("</urlset>", project_urls + "</urlset>")
        main_sitemap_path.write_text(main_sitemap, encoding="utf-8", newline="\n")

    index_path = ROOT / "index.html"
    index = index_path.read_text(encoding="utf-8")
    needle = "                    ${projeto.apk ? `"
    link = '                    ${projeto.pagina ? `<a href="${projeto.pagina}" class="btn secondary">P&aacute;gina do projeto</a>` : ""}\n'
    if "P&aacute;gina do projeto" not in index:
        if needle not in index:
            raise RuntimeError("Não foi possível localizar as ações do projeto em index.html")
        index = index.replace(needle, link + needle, 1)
        index_path.write_text(index, encoding="utf-8", newline="\n")

    robots_path = ROOT / "robots.txt"
    robots = robots_path.read_text(encoding="utf-8").rstrip() + "\n"
    project_sitemap = f"Sitemap: {BASE}/project-sitemap.xml"
    if project_sitemap not in robots:
        robots += project_sitemap + "\n"
        robots_path.write_text(robots, encoding="utf-8", newline="\n")


if __name__ == "__main__":
    main()
