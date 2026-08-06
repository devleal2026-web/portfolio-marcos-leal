from __future__ import annotations

import json
from pathlib import Path


root = Path(__file__).resolve().parents[1]
catalog_path = root / "videos.json"
catalog = json.loads(catalog_path.read_text(encoding="utf-8"))

pages = {
    "assets/videos/aero-access.mp4": "videos/aero-access/",
    "assets/videos/alf.mp4": "videos/alf/",
    "assets/videos/avisou.mp4": "videos/avisou/",
    "assets/videos/encontre-facil.mp4": "videos/encontre-facil/",
    "assets/videos/mibis.mp4": "videos/mibis/",
    "assets/videos/neuroloop.mp4": "videos/neuroloop/",
    "assets/videos/construindo-palavras.mp4": "videos/construindo-palavras/",
    "assets/videos/airport-baggage-simulator.mp4": "videos/airport-baggage-simulator/",
    "assets/videos/laura-lara-aventura.mp4": "videos/laura-lara-aventura/",
}

for video in catalog:
    video["pagina"] = pages[video["arquivo"]]

catalog_path.write_text(
    json.dumps(catalog, ensure_ascii=False, indent=2) + "\n",
    encoding="utf-8",
    newline="\n",
)

index_path = root / "index.html"
index = index_path.read_text(encoding="utf-8")
needle = '                    <button type="button" class="btn assistir-video" data-video="${video.arquivo}" data-titulo="${video.titulo}">Assistir ao filme</button>\n'
addition = needle + '                    ${video.pagina ? `<a href="${video.pagina}" class="btn secondary">P&aacute;gina do v&iacute;deo</a>` : ""}\n'
if "P&aacute;gina do v&iacute;deo" not in index:
    if needle not in index:
        raise RuntimeError("Não foi possível localizar o botão do filme em index.html")
    index = index.replace(needle, addition, 1)
    index_path.write_text(index, encoding="utf-8", newline="\n")
