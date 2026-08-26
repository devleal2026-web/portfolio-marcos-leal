# Leal Academy

Plataforma de cursos operacionais e simulador de bagagens aeroportuárias.

Acesso principal:
- `index.html` abre o simulador.
- `pages/academy-access.html` abre a plataforma Leal Academy com cadastro local por Nome e Gmail.

## Protecao de conteudo dos cursos

Antes de alterar cursos ja prontos ou SQLs do Supabase, rode:

```bash
node tools/validate-academy-course-content.js
```

Essa checagem compara os SQLs de cursos com o conteudo completo aprovado e com o baseline minimo em `quality/course-content-baseline.json`. Se um curso perder modulos, ficar com conteudo muito curto ou tiver reducao relevante de material, o comando falha e aponta o curso afetado.

Atualize o baseline somente quando uma reducao de conteudo for intencional:

```bash
node tools/validate-academy-course-content.js --write-baseline
```
