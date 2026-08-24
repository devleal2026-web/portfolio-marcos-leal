const SUPABASE_URL =
'https://axpmsjiirrzljeeqewgs.supabase.co'

const SUPABASE_KEY =
'sb_publishable_XvogqlnWLM0l5Cikeb2AsQ_sFuV8RXe'

const supabaseClient =
supabase.createClient(

    SUPABASE_URL,

    SUPABASE_KEY

)

/*==========================================================
MENSAGENS AMIGAVEIS
==========================================================*/

(function configurarMensagensAmigaveis(){
    if(window.__friendlyMessagesReady){
        return;
    }

    window.__friendlyMessagesReady = true;

    const alertOriginal = window.alert.bind(window);

    function normalizar(texto){
        return String(texto ?? "").trim();
    }

    function mensagemAmigavel(mensagem){
        const texto = normalizar(mensagem);
        const lower = texto.toLowerCase();

        if(texto === ""){
            return "Não foi possível concluir a operação. Tente novamente em instantes.";
        }

        if(lower.includes("schema cache") || lower.includes("could not find the table")){
            return "Ainda falta atualizar a estrutura do banco de dados no Supabase para esta função. Execute o SQL correspondente e tente novamente.";
        }

        if(lower.includes("could not find the function")){
            return "A função necessária ainda não foi criada no Supabase. Execute o SQL desta etapa e atualize a página.";
        }

        if(lower.includes("relation") && lower.includes("does not exist")){
            return "Uma tabela necessária ainda não existe no Supabase. Execute o SQL correspondente antes de continuar.";
        }

        if(lower.includes("column") && lower.includes("does not exist")){
            return "O banco de dados precisa de uma atualização de campos para esta operação. Execute o SQL mais recente do módulo.";
        }

        if(lower.includes("permission denied") || lower.includes("row-level security") || lower.includes("violates row-level security")){
            return "Sua conta não tem permissão para concluir esta ação. Verifique se você está autenticado e se as políticas de acesso do Supabase foram aplicadas.";
        }

        if(lower.includes("jwt") || lower.includes("invalid token") || lower.includes("auth session missing") || lower.includes("not authenticated")){
            return "Sua sessão expirou ou não foi carregada corretamente. Entre novamente com sua conta Google.";
        }

        if(lower.includes("failed to fetch") || lower.includes("networkerror") || lower.includes("network request failed")){
            return "Não foi possível conectar ao Supabase agora. Verifique sua internet e tente novamente.";
        }

        if(lower.includes("duplicate key") || lower.includes("already exists")){
            return "Este registro já existe. Verifique os dados informados ou atualize a página.";
        }

        if(lower.includes("invalid input syntax for type uuid")){
            return "Não foi possível localizar o registro selecionado. Atualize a lista e tente novamente.";
        }

        return texto;
    }

    window.friendlyErrorMessage = mensagemAmigavel;

    window.showFriendlyAlert = function showFriendlyAlert(mensagem){
        alertOriginal(mensagemAmigavel(mensagem));
    };

    window.alert = function alertComMensagemAmigavel(mensagem){
        alertOriginal(mensagemAmigavel(mensagem));
    };
})();
