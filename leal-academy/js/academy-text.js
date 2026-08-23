/*==========================================================
LEAL ACADEMY TEXT NORMALIZER
Correção visual de acentuação em textos renderizados
==========================================================*/

"use strict";

const LealText = (() => {
    const accentPairs = [
        ["Acessivel", "Acessível"], ["acessivel", "acessível"],
        ["Acoes", "Ações"], ["acoes", "ações"],
        ["Acao", "Ação"], ["acao", "ação"],
        ["Aeroportuario", "Aeroportuário"], ["aeroportuario", "aeroportuário"],
        ["Aeroportuaria", "Aeroportuária"], ["aeroportuaria", "aeroportuária"],
        ["Apos", "Após"], ["apos", "após"],
        ["Analise", "Análise"], ["analise", "análise"],
        ["Aplicacao", "Aplicação"], ["aplicacao", "aplicação"],
        ["Aprovacao", "Aprovação"], ["aprovacao", "aprovação"],
        ["Aprovadoes", "Aprovações"],
        ["Atencao", "Atenção"], ["atencao", "atenção"],
        ["Atendimento", "Atendimento"],
        ["Ate", "Até"], ["ate", "até"],
        ["Automatica", "Automática"], ["automatica", "automática"],
        ["Automatico", "Automático"], ["automatico", "automático"],
        ["Avaliacao", "Avaliação"], ["avaliacao", "avaliação"],
        ["Aviacao", "Aviação"], ["aviacao", "aviação"],
        ["Bagagem", "Bagagem"],
        ["Biblioteca", "Biblioteca"],
        ["Botao", "Botão"], ["botao", "botão"],
        ["Cadastro", "Cadastro"],
        ["Certificacao", "Certificação"], ["certificacao", "certificação"],
        ["Certificado", "Certificado"],
        ["Codigo", "Código"], ["codigo", "código"],
        ["Codigos", "Códigos"], ["codigos", "códigos"],
        ["Comunicacao", "Comunicação"], ["comunicacao", "comunicação"],
        ["Compensacao", "Compensação"], ["compensacao", "compensação"],
        ["Concluida", "Concluída"], ["concluida", "concluída"],
        ["Concluidas", "Concluídas"], ["concluidas", "concluídas"],
        ["Concluido", "Concluído"], ["concluido", "concluído"],
        ["Concluidos", "Concluídos"], ["concluidos", "concluídos"],
        ["Conclusao", "Conclusão"], ["conclusao", "conclusão"],
        ["Condicao", "Condição"], ["condicao", "condição"],
        ["Conexao", "Conexão"], ["conexao", "conexão"],
        ["Conexoes", "Conexões"], ["conexoes", "conexões"],
        ["Confirmacao", "Confirmação"], ["confirmacao", "confirmação"],
        ["Conteudo", "Conteúdo"], ["conteudo", "conteúdo"],
        ["Conteudos", "Conteúdos"], ["conteudos", "conteúdos"],
        ["Contestacao", "Contestação"], ["contestacao", "contestação"],
        ["Continuo", "Contínuo"], ["continuo", "contínuo"],
        ["Critico", "Crítico"], ["critico", "crítico"],
        ["Critica", "Crítica"], ["critica", "crítica"],
        ["Danos", "Danos"],
        ["Deficiencia", "Deficiência"], ["deficiencia", "deficiência"],
        ["Definicao", "Definição"], ["definicao", "definição"],
        ["Deposito", "Depósito"], ["deposito", "depósito"],
        ["Descricao", "Descrição"], ["descricao", "descrição"],
        ["Deteccao", "Detecção"], ["deteccao", "detecção"],
        ["Disponivel", "Disponível"], ["disponivel", "disponível"],
        ["Disponiveis", "Disponíveis"], ["disponiveis", "disponíveis"],
        ["Duvida", "Dúvida"], ["duvida", "dúvida"],
        ["Edicao", "Edição"], ["edicao", "edição"],
        ["Eficiencia", "Eficiência"], ["eficiencia", "eficiência"],
        ["Endereco", "Endereço"], ["endereco", "endereço"],
        ["Escritorio", "Escritório"], ["escritorio", "escritório"],
        ["Especifica", "Específica"], ["especifica", "específica"],
        ["Especifico", "Específico"], ["especifico", "específico"],
        ["Esta", "Está"], ["esta", "está"],
        ["Etiqueta", "Etiqueta"],
        ["Evidencia", "Evidência"], ["evidencia", "evidência"],
        ["Evidencias", "Evidências"], ["evidencias", "evidências"],
        ["Excecao", "Exceção"], ["excecao", "exceção"],
        ["Exercicio", "Exercício"], ["exercicio", "exercício"],
        ["Experiencia", "Experiência"], ["experiencia", "experiência"],
        ["Funcao", "Função"], ["funcao", "função"],
        ["Gestao", "Gestão"], ["gestao", "gestão"],
        ["Historico", "Histórico"], ["historico", "histórico"],
        ["Identificacao", "Identificação"], ["identificacao", "identificação"],
        ["Informacao", "Informação"], ["informacao", "informação"],
        ["Informacoes", "Informações"], ["informacoes", "informações"],
        ["Iniciacao", "Iniciação"], ["iniciacao", "iniciação"],
        ["Inspecao", "Inspeção"], ["inspecao", "inspeção"],
        ["Intermediario", "Intermediário"], ["intermediario", "intermediário"],
        ["Interpretacao", "Interpretação"], ["interpretacao", "interpretação"],
        ["Introducao", "Introdução"], ["introducao", "introdução"],
        ["Ja", "Já"], ["ja", "já"],
        ["Licao", "Lição"], ["licao", "lição"],
        ["Licoes", "Lições"], ["licoes", "lições"],
        ["Lideranca", "Liderança"], ["lideranca", "liderança"],
        ["Localizacao", "Localização"], ["localizacao", "localização"],
        ["Matricula", "Matrícula"], ["matricula", "matrícula"],
        ["Metricas", "Métricas"], ["metricas", "métricas"],
        ["Minimo", "Mínimo"], ["minimo", "mínimo"],
        ["Modulo", "Módulo"], ["modulo", "módulo"],
        ["Modulos", "Módulos"], ["modulos", "módulos"],
        ["Nao", "Não"], ["nao", "não"],
        ["Navegacao", "Navegação"], ["navegacao", "navegação"],
        ["Necessario", "Necessário"], ["necessario", "necessário"],
        ["Necessaria", "Necessária"], ["necessaria", "necessária"],
        ["Ocorrencia", "Ocorrência"], ["ocorrencia", "ocorrência"],
        ["Operacao", "Operação"], ["operacao", "operação"],
        ["Orientacao", "Orientação"], ["orientacao", "orientação"],
        ["Pagina", "Página"], ["pagina", "página"],
        ["Padrao", "Padrão"], ["padrao", "padrão"],
        ["Padroes", "Padrões"], ["padroes", "padrões"],
        ["Participacao", "Participação"], ["participacao", "participação"],
        ["Pendencia", "Pendência"], ["pendencia", "pendência"],
        ["Pendencias", "Pendências"], ["pendencias", "pendências"],
        ["Possivel", "Possível"], ["possivel", "possível"],
        ["Pratica", "Prática"], ["pratica", "prática"],
        ["Praticas", "Práticas"], ["praticas", "práticas"],
        ["Preparacao", "Preparação"], ["preparacao", "preparação"],
        ["Prevencao", "Prevenção"], ["prevencao", "prevenção"],
        ["Proxima", "Próxima"], ["proxima", "próxima"],
        ["Proximo", "Próximo"], ["proximo", "próximo"],
        ["Protecao", "Proteção"], ["protecao", "proteção"],
        ["Publica", "Pública"], ["publica", "pública"],
        ["Questao", "Questão"], ["questao", "questão"],
        ["Questoes", "Questões"], ["questoes", "questões"],
        ["Rapida", "Rápida"], ["rapida", "rápida"],
        ["Rapido", "Rápido"], ["rapido", "rápido"],
        ["Reclamacao", "Reclamação"], ["reclamacao", "reclamação"],
        ["Reclamacoes", "Reclamações"], ["reclamacoes", "reclamações"],
        ["Referencia", "Referência"], ["referencia", "referência"],
        ["Regiao", "Região"], ["regiao", "região"],
        ["Relatorio", "Relatório"], ["relatorio", "relatório"],
        ["Resolucao", "Resolução"], ["resolucao", "resolução"],
        ["Restricao", "Restrição"], ["restricao", "restrição"],
        ["Restricoes", "Restrições"], ["restricoes", "restrições"],
        ["Retencao", "Retenção"], ["retencao", "retenção"],
        ["Revisao", "Revisão"], ["revisao", "revisão"],
        ["Satisfatoria", "Satisfatória"], ["satisfatoria", "satisfatória"],
        ["Seguranca", "Segurança"], ["seguranca", "segurança"],
        ["Selecao", "Seleção"], ["selecao", "seleção"],
        ["Simulacao", "Simulação"], ["simulacao", "simulação"],
        ["Situacao", "Situação"], ["situacao", "situação"],
        ["Situacoes", "Situações"], ["situacoes", "situações"],
        ["Solucao", "Solução"], ["solucao", "solução"],
        ["Tecnica", "Técnica"], ["tecnica", "técnica"],
        ["Tecnico", "Técnico"], ["tecnico", "técnico"],
        ["Ultima", "Última"], ["ultima", "última"],
        ["Ultimo", "Último"], ["ultimo", "último"],
        ["Usuarios", "Usuários"], ["usuarios", "usuários"],
        ["Usuario", "Usuário"], ["usuario", "usuário"],
        ["Validacao", "Validação"], ["validacao", "validação"],
        ["Voce", "Você"], ["voce", "você"]
    ];

    const skipSelector = [
        "script",
        "style",
        "textarea",
        "input",
        "select",
        "option",
        "code",
        "pre",
        "kbd",
        "samp",
        "svg",
        ".lesson-command",
        ".font-monospace",
        ".no-auto-accent"
    ].join(",");

    function apply(value){
        let text = String(value ?? "");

        accentPairs.forEach(([plain, accented]) => {
            text = text.replace(new RegExp(`\\b${plain}\\b`, "g"), accented);
        });

        return text;
    }

    function normalizeTextNode(node){
        const parent = node.parentElement;

        if(!parent || parent.closest(skipSelector)){
            return;
        }

        const normalized = apply(node.nodeValue);

        if(normalized !== node.nodeValue){
            node.nodeValue = normalized;
        }
    }

    function normalize(root = document.body){
        if(!root){
            return;
        }

        if(root.nodeType === Node.TEXT_NODE){
            normalizeTextNode(root);
            return;
        }

        if(root.nodeType !== Node.ELEMENT_NODE && root.nodeType !== Node.DOCUMENT_NODE){
            return;
        }

        if(root.closest?.(skipSelector)){
            return;
        }

        const walker = document.createTreeWalker(
            root,
            NodeFilter.SHOW_TEXT,
            {
                acceptNode(node){
                    return node.parentElement?.closest(skipSelector)
                        ? NodeFilter.FILTER_REJECT
                        : NodeFilter.FILTER_ACCEPT;
                }
            }
        );

        const nodes = [];
        let node = walker.nextNode();

        while(node){
            nodes.push(node);
            node = walker.nextNode();
        }

        nodes.forEach(normalizeTextNode);
    }

    function observe(){
        if(!document.body){
            return;
        }

        const observer = new MutationObserver(mutations => {
            mutations.forEach(mutation => {
                mutation.addedNodes.forEach(node => normalize(node));
            });
        });

        observer.observe(document.body, {
            childList:true,
            subtree:true
        });
    }

    function boot(){
        normalize(document.body);
        observe();
    }

    return {
        apply,
        normalize,
        boot
    };
})();

document.addEventListener("DOMContentLoaded", () => {
    LealText.boot();
});

window.LealText = LealText;
