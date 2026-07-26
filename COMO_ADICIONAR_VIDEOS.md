# Como adicionar novos vídeos

1. Copie o arquivo MP4 para `assets/videos/`.
2. Crie uma imagem de capa JPG ou PNG em `assets/videos/posters/`.
3. Abra `videos.json` e acrescente um objeto seguindo este modelo:

```json
{
  "titulo": "Nome do projeto",
  "categoria": "Categoria",
  "descricao": "Resumo promocional do projeto.",
  "arquivo": "assets/videos/nome-do-video.mp4",
  "poster": "assets/videos/posters/nome-do-video.jpg"
}
```

Use nomes de arquivos sem espaços e mantenha a vírgula entre os objetos do catálogo.
