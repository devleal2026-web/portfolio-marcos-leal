# Procedimento seguro para criacao e atualizacao de cursos

Este procedimento existe para impedir que um curso novo altere, contamine ou sobrescreva visualmente outro curso.

## Regra principal

Toda criacao ou atualizacao de curso deve ter escopo pelo `id` exato do curso. Nunca usar palavras do titulo, modulo ou conteudo como criterio global para trocar imagem, prova, laboratorio ou qualquer recurso visual.

## Checklist obrigatorio

1. Definir o `course.id` antes de qualquer alteracao.
2. SQL deve usar `where id = '<course-id>'` ou `on conflict (id)` para apenas um curso.
3. Nao usar `update academy_courses set ...` sem `where id` exato.
4. Nao usar `delete from academy_courses` sem `where id` exato.
5. Overrides no front-end devem comecar com uma trava explicita, por exemplo: `course.id === '<course-id>'`.
6. Nao reutilizar imagens de outro curso como fallback automatico por palavras parecidas.
7. Validar que todas as imagens referenciadas existem em `leal-academy/assets/academy-screenshots/<curso>/` ou em URL publica estavel.
8. Rodar `node --check leal-academy/js/academy.js` quando houver alteracao em JavaScript.
9. Revisar `git diff --stat` e confirmar que apenas arquivos relacionados ao curso ou a correcao foram alterados.
10. Publicar somente depois de validar localmente e, quando aplicavel, confirmar o arquivo online com cache-buster novo.

## Regra para imagens por curso

Se uma imagem precisar ser forcada pelo JavaScript, a funcao deve validar primeiro o curso exato:

```js
function isExactTargetCourse(course){
    return String(course?.id || "") === "id-do-curso";
}

function forceCourseVisual(course, moduleIndex, item){
    if(!isExactTargetCourse(course)){
        return item;
    }

    // Regras especificas do curso aqui.
    return item;
}
```

## Falha que este procedimento evita

A plataforma nao deve trocar imagem com base apenas em palavras como `embarque`, `portao`, `conexao`, `check-in`, `cliente` ou qualquer termo comum entre cursos. Esses termos aparecem em varios treinamentos e nao identificam um curso de forma segura.