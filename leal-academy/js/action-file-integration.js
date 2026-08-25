/*==========================================================
ACTION FILE INTEGRATION
Safe event mirror for simulator modules
==========================================================*/

"use strict";

const ActionFileIntegration = (() => {
    const CODE_INFO = {
        AA: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Action Message",
            description:"Ação operacional criada pelo simulador."
        },
        AAH: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Update AHL",
            description:"Alteração de informações no AHL."
        },
        AOH: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Update OHD",
            description:"Alteração de informações no OHD."
        },
        ADP: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Update DPR",
            description:"Alteração de informações no DPR."
        },
        AFP: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Update RFP",
            description:"Alteração de informações no registro RFP."
        },
        WM: {
            category:"SYSTEM_MATCHES",
            label:"System Matches",
            title:"System Match",
            description:"Match automático entre processos do simulador."
        },
        FW: {
            category:"FORWARD_MESSAGES",
            label:"Forward Messages",
            title:"Forward Message",
            description:"Mensagem de encaminhamento operacional."
        },
        FWD: {
            category:"FORWARD_MESSAGES",
            label:"Forward Messages",
            title:"Forward Bag",
            description:"Envio de bagagem com etiqueta Rush."
        },
        ROH: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Request On-Hand",
            description:"Solicitação de envio de OHD."
        },
        FOH: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Forward On-Hand",
            description:"Resposta ou envio de OHD solicitado."
        },
        FAH: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Forward Delayed Bag",
            description:"Envio de bagagem localizada vinculada a AHL."
        },
        BDO: {
            category:"ACTION_MESSAGES",
            label:"Action Messages",
            title:"Baggage Delivery Order",
            description:"Ordem de entrega de bagagem."
        },
        SP: {
            category:"SYSTEM_PROMPTS",
            label:"System Prompts",
            title:"System Prompt",
            description:"Alerta operacional automático."
        }
    };

    function text(value){
        return String(value ?? "").trim().toUpperCase();
    }

    function stationFrom(record){
        return text(record?.station || String(record?.reference_number || "").substring(0, 3) || "GRU");
    }

    function airlineFrom(record){
        return text(record?.airline || String(record?.reference_number || "").substring(3, 5) || "YY");
    }

    function history(payload){
        return [{
            at:new Date().toISOString(),
            status:payload.status,
            action:payload.action_title,
            message:payload.message,
            assigned_to:payload.assigned_to || "",
            forward_to:payload.forward_to || ""
        }];
    }

    async function exists(payload){
        const { data, error } = await supabaseClient
            .from("action_files")
            .select("id")
            .eq("case_type", payload.case_type)
            .eq("reference_number", payload.reference_number)
            .eq("action_code", payload.action_code)
            .eq("message", payload.message)
            .limit(1);

        if(error){
            return false;
        }

        return Array.isArray(data) && data.length > 0;
    }

    async function record(input){
        if(typeof supabaseClient === "undefined" || !supabaseClient){
            return null;
        }

        const code = text(input.action_code || "AA");
        const info = CODE_INFO[code] || CODE_INFO.AA;

        const payload = {
            case_type:text(input.case_type || "AHL"),
            case_id:input.case_id || null,
            reference_number:text(input.reference_number),
            station:text(input.station),
            airline:text(input.airline),
            action_code:code,
            action_category:input.action_category || info.category,
            action_category_label:input.action_category_label || info.label,
            action_title:input.action_title || info.title,
            action_description:input.action_description || info.description,
            status:input.status || "PENDENTE",
            priority:input.priority || "NORMAL",
            assigned_to:input.assigned_to || "",
            forward_to:text(input.forward_to),
            message:input.message || info.description,
            response:input.response || "",
            history:[]
        };

        payload.history = history(payload);

        if(!payload.reference_number || !payload.message){
            return null;
        }

        try{
            if(await exists(payload)){
                return null;
            }

            const { data, error } = await supabaseClient
                .from("action_files")
                .insert([payload])
                .select()
                .single();

            if(error){
                console.warn("Action File não recebeu o evento automático:", error);
                return null;
            }

            return data;
        }catch(error){
            console.warn("Action File não recebeu o evento automático:", error);
            return null;
        }
    }

    async function recordCaseCreated(caseType, recordData){
        const type = text(caseType);
        const reference = text(recordData?.reference_number);

        return record({
            case_type:type,
            case_id:recordData?.id,
            reference_number:reference,
            station:stationFrom(recordData),
            airline:airlineFrom(recordData),
            action_code:"AA",
            message:`${type} ${reference} criado para treinamento. Conferir dados e acompanhar pendências no Action File.`,
            assigned_to:recordData?.ag || "",
            priority:"NORMAL"
        });
    }

    async function recordCaseUpdated(caseType, recordData){
        const type = text(caseType);
        const reference = text(recordData?.reference_number);
        const codeByType = {
            AHL:"AAH",
            OHD:"AOH",
            DPR:"ADP",
            RFP:"AFP"
        };

        return record({
            case_type:type,
            case_id:recordData?.id,
            reference_number:reference,
            station:stationFrom(recordData),
            airline:airlineFrom(recordData),
            action_code:codeByType[type] || "AA",
            message:`${type} ${reference} alterado no simulador em ${new Date().toLocaleString("pt-BR")}. Conferir dados atualizados do processo.`,
            assigned_to:recordData?.ag || "",
            priority:"NORMAL"
        });
    }

    async function recordSystemMatch(ahl, ohd, match){
        const ahlReference = text(ahl?.reference_number);
        const ohdReference = text(ohd?.reference_number);
        const percentage = Number(match?.percentage || 0);

        return record({
            case_type:"AHL",
            case_id:ahl?.id,
            reference_number:ahlReference,
            station:stationFrom(ahl),
            airline:airlineFrom(ahl),
            action_code:"WM",
            action_category:"SYSTEM_MATCHES",
            action_category_label:"System Matches",
            action_title:"System Match",
            forward_to:stationFrom(ohd),
            message:`Match automático: AHL ${ahlReference} x OHD ${ohdReference} com ${percentage}%. Analisar dados e decidir ROH/FOH/FAH/FWD conforme a aula.`,
            assigned_to:"LL",
            priority:percentage >= 80 ? "ALTA" : "NORMAL"
        });
    }

    async function fetchCase(table, id, reference){
        let query = supabaseClient
            .from(table)
            .select("*");

        if(id){
            query = query.eq("id", id);
        }else if(reference){
            query = query.eq("reference_number", reference);
        }else{
            return null;
        }

        const { data, error } = await query.maybeSingle();

        if(error){
            console.warn("Não foi possível carregar processo para refletir match no Action File:", error);
            return null;
        }

        return data || null;
    }

    async function syncExistingMatches(limit = 300){
        if(typeof supabaseClient === "undefined" || !supabaseClient){
            return {
                scanned:0,
                created:0,
                skipped:0
            };
        }

        const { data, error } = await supabaseClient
            .from("baggage_matches")
            .select("*")
            .order("percentage", { ascending:false })
            .limit(limit);

        if(error){
            throw error;
        }

        let created = 0;
        let skipped = 0;

        for(const match of data || []){
            const ahl = await fetchCase("ahl_cases", match.ahl_id, match.ahl_reference);
            const ohd = await fetchCase("ohd_cases", match.ohd_id, match.ohd_reference);

            if(!ahl || !ohd){
                skipped++;
                continue;
            }

            const recordCreated = await recordSystemMatch(ahl, ohd, match);

            if(recordCreated){
                created++;
            }else{
                skipped++;
            }
        }

        return {
            scanned:(data || []).length,
            created,
            skipped
        };
    }

    return {
        record,
        recordCaseCreated,
        recordCaseUpdated,
        recordSystemMatch,
        syncExistingMatches
    };
})();

window.ActionFileIntegration = ActionFileIntegration;
