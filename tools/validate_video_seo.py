from __future__ import annotations

import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path


root = Path(__file__).resolve().parents[1]
catalog = json.loads((root / "videos.json").read_text(encoding="utf-8"))
assert len(catalog) == 9

for video in catalog:
    for relative in (video["arquivo"], video["poster"], video["pagina"] + "index.html"):
        assert (root / relative).is_file(), relative

pages = list((root / "videos").glob("*/index.html"))
assert len(pages) == 9
for page in pages:
    source = page.read_text(encoding="utf-8")
    match = re.search(
        r'<script type="application/ld\+json">\s*(.*?)\s*</script>',
        source,
        flags=re.DOTALL,
    )
    assert match, page
    data = json.loads(match.group(1))
    assert data["@type"] == "VideoObject"
    assert data["contentUrl"].endswith(".mp4")
    assert data["thumbnailUrl"][0].endswith(".jpg")

ET.parse(root / "sitemap.xml")
ET.parse(root / "video-sitemap.xml")
print("9 vídeos, miniaturas, páginas, VideoObject e sitemaps: OK")
