from __future__ import annotations

import json
import re
import xml.etree.ElementTree as ET
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlparse


ROOT = Path(__file__).resolve().parents[1]
SITEMAP_NS = {"s": "http://www.sitemaps.org/schemas/sitemap/0.9"}


class DocumentParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.hrefs: list[str] = []
        self.title_parts: list[str] = []
        self.in_title = False

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        values = dict(attrs)
        if tag == "a" and values.get("href"):
            self.hrefs.append(values["href"] or "")
        if tag == "title":
            self.in_title = True

    def handle_endtag(self, tag: str) -> None:
        if tag == "title":
            self.in_title = False

    def handle_data(self, data: str) -> None:
        if self.in_title:
            self.title_parts.append(data)


def validate_html(path: Path) -> str:
    source = path.read_text(encoding="utf-8")
    parser = DocumentParser()
    parser.feed(source)
    title = "".join(parser.title_parts).strip()
    assert title, f"Página sem title: {path}"
    assert "DevLeal2026" in title, f"Marca ausente no title: {path}"
    assert 'rel="canonical"' in source, f"Canonical ausente: {path}"
    for block in re.findall(r'<script type="application/ld\+json">\s*(.*?)\s*</script>', source, re.DOTALL):
        json.loads(block)
    for href in parser.hrefs:
        parsed = urlparse(href)
        if parsed.scheme or href.startswith(("#", "//")):
            continue
        target = (path.parent / unquote(parsed.path)).resolve()
        if href.endswith("/"):
            target /= "index.html"
        assert target.exists(), f"Link interno ausente em {path}: {href}"
    return title


pages = [ROOT / "index.html"]
pages += sorted((ROOT / "videos").glob("*/index.html"))
pages += sorted((ROOT / "projetos").glob("*/index.html"))
assert len(pages) == 20
titles = [validate_html(page) for page in pages]
assert len(titles) == len(set(titles)), "Existem títulos duplicados"

main_urls = ET.parse(ROOT / "sitemap.xml").findall("s:url", SITEMAP_NS)
project_urls = ET.parse(ROOT / "project-sitemap.xml").findall("s:url", SITEMAP_NS)
video_urls = ET.parse(ROOT / "video-sitemap.xml").findall("s:url", SITEMAP_NS)
assert len(main_urls) == 20
assert len(project_urls) == 10
assert len(video_urls) == 9

robots = (ROOT / "robots.txt").read_text(encoding="utf-8")
assert robots.count("Sitemap:") == 3
print("SEO OK: 20 páginas, 20 títulos únicos, JSON-LD, links internos e 3 sitemaps válidos")
