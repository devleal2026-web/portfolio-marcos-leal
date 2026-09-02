# Configuracao do dominio oficial Leal Academy

Dominio oficial: `www.lealacademy.com.br`

Objetivo recomendado: usar o Netlify como endereco principal da plataforma e manter o GitHub Pages como endereco alternativo tecnico. O mesmo host `www.lealacademy.com.br` nao deve apontar simultaneamente para GitHub Pages e Netlify, porque o DNS precisa escolher um destino para o CNAME de `www`.

## 1. Netlify como endereco oficial

No Netlify, acesse o site da Leal Academy e adicione os dominios:

- `www.lealacademy.com.br`
- `lealacademy.com.br`

Depois configure o DNS no provedor do dominio:

| Tipo | Nome/Host | Valor/Destino |
| --- | --- | --- |
| CNAME | `www` | `<seu-site-netlify>.netlify.app` |
| A | `@` | `75.2.60.5` |

Se o provedor permitir ALIAS, ANAME ou CNAME flattening no dominio raiz, pode usar no lugar do A:

| Tipo | Nome/Host | Valor/Destino |
| --- | --- | --- |
| ALIAS/ANAME/CNAME flattening | `@` | `apex-loadbalancer.netlify.com` |

No Netlify, aguarde a verificacao DNS e habilite HTTPS quando o certificado estiver disponivel.

## 2. GitHub Pages como acesso alternativo

Mantenha o acesso atual pelo GitHub Pages:

`https://devleal2026-web.github.io/portfolio-marcos-leal/leal-academy/pages/academy.html`

Nao use `www.lealacademy.com.br` tambem no GitHub Pages se ele ja estiver apontando para Netlify. Se quiser um dominio proprio separado para o GitHub Pages, use um subdominio diferente, por exemplo:

`github.lealacademy.com.br`

Nesse caso, configure no DNS:

| Tipo | Nome/Host | Valor/Destino |
| --- | --- | --- |
| CNAME | `github` | `devleal2026-web.github.io` |

E configure esse mesmo subdominio em GitHub > Repository > Settings > Pages > Custom domain.

## 3. Supabase Auth

No Supabase, acesse Authentication > URL Configuration.

Configure Site URL:

`https://www.lealacademy.com.br`

Adicione em Redirect URLs:

- `https://www.lealacademy.com.br/**`
- `https://lealacademy.com.br/**`
- `https://devleal2026-web.github.io/portfolio-marcos-leal/**`
- `https://<seu-site-netlify>.netlify.app/**`

Se usar um subdominio GitHub proprio, adicione tambem:

- `https://github.lealacademy.com.br/**`

## 4. Resultado esperado

- `https://www.lealacademy.com.br` abre a plataforma pelo Netlify.
- `https://lealacademy.com.br` redireciona/serve a mesma plataforma.
- GitHub Pages continua funcionando pelo link atual.
- Supabase salva os mesmos dados independentemente de acessar por Netlify, dominio oficial ou GitHub Pages.

## 5. Observacoes importantes

- Propagacao DNS pode levar de alguns minutos ate 24-48 horas.
- Evite wildcard DNS, como `*.lealacademy.com.br`, para reduzir risco de takeover.
- O banco de dados continua sendo o mesmo Supabase; mudar o dominio nao duplica cursos, alunos, simulador ou area administrativa.
