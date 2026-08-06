from __future__ import annotations

import html
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BASE = "https://devleal2026-web.github.io/portfolio-marcos-leal"
VERIFY = "HJ8K8C9tw1Pk2vYhzlsIoNYQVJHJviNGZB7VuuIisPc"

VIDEOS = [
    {
        "slug": "aero-access",
        "title": "Aero Access",
        "category": "Operação aeroportuária",
        "description": "Solução digital para inspeção, rastreabilidade e tratamento seguro de ocorrências com bagagens.",
        "duration": "PT1M30.75S",
        "seconds": 91,
        "upload": "2026-07-26T10:40:05-03:00",
    },
    {
        "slug": "alf",
        "title": "ALF — Bagagens Extraviadas",
        "category": "Operação aeroportuária",
        "description": "Fluxo estruturado para registrar, acompanhar e solucionar ocorrências de bagagens extraviadas.",
        "duration": "PT44.48S",
        "seconds": 44,
        "upload": "2026-07-26T10:40:05-03:00",
    },
    {
        "slug": "avisou",
        "title": "AvisoU",
        "category": "Aplicativo Android",
        "description": "Comunicação ágil entre portarias e moradores para avisos e recebimento de encomendas.",
        "duration": "PT1M14.66S",
        "seconds": 75,
        "upload": "2026-07-26T10:40:05-03:00",
    },
    {
        "slug": "encontre-facil",
        "title": "Encontre Fácil",
        "category": "Aplicativo Android",
        "description": "Gestão inteligente de achados e perdidos com organização, consulta e rastreabilidade.",
        "duration": "PT59.53S",
        "seconds": 60,
        "upload": "2026-07-26T10:40:05-03:00",
    },
    {
        "slug": "mibis",
        "title": "Mibis",
        "category": "Jogo",
        "description": "Experiência visual de aventura com personagens carismáticos, evolução e cenários imersivos.",
        "duration": "PT54.06S",
        "seconds": 54,
        "upload": "2026-07-26T10:40:05-03:00",
    },
    {
        "slug": "neuroloop",
        "title": "NeuroLoop",
        "category": "Jogo",
        "description": "Jogo arcade de ritmo e precisão que desafia reflexos, concentração e formação de combos.",
        "duration": "PT49.26S",
        "seconds": 49,
        "upload": "2026-07-26T10:40:05-03:00",
    },
    {
        "slug": "construindo-palavras",
        "title": "Construindo Palavras",
        "category": "Jogo educativo",
        "description": "Experiência educativa e multilíngue que estimula leitura, memória e confiança por meio da formação de palavras.",
        "duration": "PT54.36S",
        "seconds": 54,
        "upload": "2026-07-26T15:40:48-03:00",
    },
    {
        "slug": "airport-baggage-simulator",
        "title": "Airport Baggage Simulator",
        "category": "Simulador operacional",
        "description": "Simulação integrada da jornada da bagagem, do check-in ao tratamento de ocorrências.",
        "duration": "PT2M6.86S",
        "seconds": 127,
        "upload": "2026-07-26T10:40:05-03:00",
    },
    {
        "slug": "laura-lara-aventura",
        "title": "Laura & Lara — A Grande Missão Sapeca",
        "category": "Jogo educativo",
        "description": "Aventura educativa com tarefas guiadas de organização, higiene, alimentação e responsabilidade infantil.",
        "duration": "PT6M22.46S",
        "seconds": 382,
        "upload": "2026-07-29T17:12:17-03:00",
    },
]


def page(video: dict[str, object]) -> str:
    slug = str(video["slug"])
    title = str(video["title"])
    description = str(video["description"])
    category = str(video["category"])
    canonical = f"{BASE}/videos/{slug}/"
    content = f"{BASE}/assets/videos/{slug}.mp4"
    thumbnail = f"{BASE}/assets/videos/posters/{slug}.jpg"
    structured = {
        "@context": "https://schema.org",
        "@type": "VideoObject",
        "name": f"{title} — filme promocional",
        "description": description,
        "thumbnailUrl": [thumbnail],
        "uploadDate": video["upload"],
        "duration": video["duration"],
        "contentUrl": content,
        "embedUrl": canonical,
        "inLanguage": "pt-BR",
        "isFamilyFriendly": True,
        "publisher": {
            "@type": "Person",
            "name": "Marcos Antonio de Sousa Leal",
            "url": f"{BASE}/",
        },
    }
    json_ld = json.dumps(structured, ensure_ascii=False, indent=8).replace("</", "<\\/")
    return f"""<!doctype html>
<html lang=\"pt-BR\">
<head>
    <meta charset=\"utf-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    <title>{html.escape(title)} | Filme promocional</title>
    <meta name=\"description\" content=\"{html.escape(description, quote=True)}\">
    <meta name=\"robots\" content=\"index, follow, max-image-preview:large, max-video-preview:-1\">
    <meta name=\"google-site-verification\" content=\"{VERIFY}\">
    <link rel=\"canonical\" href=\"{canonical}\">
    <meta property=\"og:type\" content=\"video.other\">
    <meta property=\"og:title\" content=\"{html.escape(title, quote=True)} — filme promocional\">
    <meta property=\"og:description\" content=\"{html.escape(description, quote=True)}\">
    <meta property=\"og:url\" content=\"{canonical}\">
    <meta property=\"og:image\" content=\"{thumbnail}\">
    <meta property=\"og:video\" content=\"{content}\">
    <meta property=\"og:video:type\" content=\"video/mp4\">
    <meta name=\"twitter:card\" content=\"player\">
    <script type=\"application/ld+json\">
{json_ld}
    </script>
    <style>
        :root {{ color-scheme: dark; --cyan:#22d3ee; --blue:#2563eb; --text:#f8fafc; --muted:#cbd5e1; }}
        * {{ box-sizing:border-box; }}
        body {{ margin:0; min-height:100vh; font-family:Inter,Segoe UI,Arial,sans-serif; color:var(--text); background:radial-gradient(circle at 75% 10%,#173b67 0,transparent 34%),#07111f; }}
        header,main,footer {{ width:min(1120px,calc(100% - 32px)); margin:auto; }}
        header {{ display:flex; align-items:center; justify-content:space-between; padding:24px 0; gap:20px; }}
        .brand {{ color:var(--text); text-decoration:none; font-weight:800; letter-spacing:.04em; }}
        .back {{ color:var(--cyan); text-decoration:none; font-weight:700; }}
        main {{ padding:42px 0 70px; }}
        .tag {{ display:inline-block; color:var(--cyan); font-weight:800; letter-spacing:.12em; text-transform:uppercase; font-size:.78rem; }}
        h1 {{ margin:.55rem 0 .8rem; font-size:clamp(2.1rem,5vw,4rem); line-height:1.05; }}
        .lead {{ max-width:760px; color:var(--muted); font-size:clamp(1rem,2vw,1.2rem); line-height:1.7; }}
        .player {{ margin-top:30px; padding:clamp(10px,2vw,20px); border:1px solid #2a4568; border-radius:22px; background:#0d1b2f; box-shadow:0 28px 80px #0008; }}
        video {{ display:block; width:100%; max-height:72vh; background:#000; border-radius:14px; }}
        .actions {{ display:flex; flex-wrap:wrap; gap:12px; margin-top:22px; }}
        .button {{ display:inline-flex; padding:12px 18px; border-radius:999px; color:white; background:linear-gradient(135deg,var(--blue),#0891b2); text-decoration:none; font-weight:800; }}
        .button.secondary {{ background:#172a45; border:1px solid #365579; }}
        footer {{ padding:24px 0 42px; color:var(--muted); border-top:1px solid #233956; }}
        footer a {{ color:var(--cyan); }}
    </style>
</head>
<body>
    <header>
        <a class=\"brand\" href=\"../../\">LEAL DESENVOLVEDOR</a>
        <a class=\"back\" href=\"../../#videos\">← Todos os filmes</a>
    </header>
    <main>
        <span class=\"tag\">{html.escape(category)}</span>
        <h1>{html.escape(title)}</h1>
        <p class=\"lead\">{html.escape(description)}</p>
        <section class=\"player\" aria-label=\"Filme promocional de {html.escape(title, quote=True)}\">
            <video controls preload=\"metadata\" poster=\"../../assets/videos/posters/{slug}.jpg\">
                <source src=\"../../assets/videos/{slug}.mp4\" type=\"video/mp4\">
                Seu navegador não oferece suporte à reprodução deste vídeo.
            </video>
            <div class=\"actions\">
                <a class=\"button\" href=\"../../#projetos\">Conheça os projetos</a>
                <a class=\"button secondary\" href=\"mailto:devleal2026@gmail.com\">Entre em contato</a>
            </div>
        </section>
    </main>
    <footer>WhatsApp: <a href=\"https://wa.me/5511950436161\">+55 11 95043-6161</a> · E-mail: <a href=\"mailto:devleal2026@gmail.com\">devleal2026@gmail.com</a></footer>
</body>
</html>
"""


def main() -> None:
    for video in VIDEOS:
        target = ROOT / "videos" / str(video["slug"])
        target.mkdir(parents=True, exist_ok=True)
        (target / "index.html").write_text(page(video), encoding="utf-8", newline="\n")

    urls = [
        f"  <url>\n    <loc>{BASE}/</loc>\n    <lastmod>2026-08-06</lastmod>\n    <changefreq>weekly</changefreq>\n    <priority>1.0</priority>\n  </url>"
    ]
    for video in VIDEOS:
        urls.append(
            "  <url>\n"
            f"    <loc>{BASE}/videos/{video['slug']}/</loc>\n"
            "    <lastmod>2026-08-06</lastmod>\n"
            "    <changefreq>monthly</changefreq>\n"
            "    <priority>0.8</priority>\n"
            "  </url>"
        )
    sitemap = '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n' + "\n".join(urls) + "\n</urlset>\n"
    (ROOT / "sitemap.xml").write_text(sitemap, encoding="utf-8", newline="\n")

    entries = []
    for video in VIDEOS:
        slug = str(video["slug"])
        entries.append(
            "  <url>\n"
            f"    <loc>{BASE}/videos/{slug}/</loc>\n"
            "    <video:video>\n"
            f"      <video:thumbnail_loc>{BASE}/assets/videos/posters/{slug}.jpg</video:thumbnail_loc>\n"
            f"      <video:title>{html.escape(str(video['title']))} — filme promocional</video:title>\n"
            f"      <video:description>{html.escape(str(video['description']))}</video:description>\n"
            f"      <video:content_loc>{BASE}/assets/videos/{slug}.mp4</video:content_loc>\n"
            f"      <video:duration>{video['seconds']}</video:duration>\n"
            f"      <video:publication_date>{video['upload']}</video:publication_date>\n"
            "      <video:family_friendly>yes</video:family_friendly>\n"
            "    </video:video>\n"
            "  </url>"
        )
    video_sitemap = '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">\n' + "\n".join(entries) + "\n</urlset>\n"
    (ROOT / "video-sitemap.xml").write_text(video_sitemap, encoding="utf-8", newline="\n")

    robots = (
        "User-agent: *\nAllow: /\n\n"
        f"Sitemap: {BASE}/sitemap.xml\n"
        f"Sitemap: {BASE}/video-sitemap.xml\n"
    )
    (ROOT / "robots.txt").write_text(robots, encoding="utf-8", newline="\n")


if __name__ == "__main__":
    main()
