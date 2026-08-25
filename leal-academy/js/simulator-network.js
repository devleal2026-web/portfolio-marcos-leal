/*==========================================================
SIMULATOR NETWORK
Bases, airlines and training context
==========================================================*/

"use strict";

const SimulatorNetwork = (() => {
    const DEFAULT_BASES = [
        "GRU", "GIG", "BSB", "CNF", "VCP", "SSA", "REC", "FOR", "POA", "CWB",
        "FLN", "BEL", "MAO", "NAT", "MCZ", "AJU", "VIX", "SDU", "IGU", "CGB"
    ].map(code => ({
        station_code: code,
        display_name: `${code} Training LL`,
        active: true
    }));

    const DEFAULT_AIRLINES = [
        "LA", "G3", "AD", "AA", "UA", "DL", "TP", "AF", "KL", "IB",
        "BA", "LH", "EK", "QR", "CM", "AV", "AC", "AR", "AM", "UX"
    ].map(code => ({
        airline_code: code,
        display_name: `Airline ${code} Training`,
        active: true
    }));

    let bases = [...DEFAULT_BASES];
    let airlines = [...DEFAULT_AIRLINES];

    function text(value){
        return String(value ?? "").trim().toUpperCase();
    }

    function option(label, value){
        return `<option value="${value}">${label}</option>`;
    }

    async function init(){
        await load();
        populatePageControls();
    }

    async function load(){
        if(typeof supabaseClient === "undefined" || !supabaseClient){
            return { bases, airlines };
        }

        const [baseResult, airlineResult] = await Promise.all([
            supabaseClient
                .from("simulator_bases")
                .select("*")
                .eq("active", true)
                .order("station_code", { ascending:true }),
            supabaseClient
                .from("simulator_airlines")
                .select("*")
                .eq("active", true)
                .order("airline_code", { ascending:true })
        ]);

        if(!baseResult.error && Array.isArray(baseResult.data) && baseResult.data.length){
            bases = baseResult.data;
        }

        if(!airlineResult.error && Array.isArray(airlineResult.data) && airlineResult.data.length){
            airlines = airlineResult.data;
        }

        if(baseResult.error || airlineResult.error){
            console.warn("Rede de treinamento usando lista padrão até o Supabase ser configurado.", {
                bases: baseResult.error,
                airlines: airlineResult.error
            });
        }

        return { bases, airlines };
    }

    function populateSelect(id, items, valueKey, labelKey, includeAllLabel){
        const field = document.getElementById(id);

        if(!field){
            return;
        }

        const current = field.value;
        const options = items
            .map(item => option(`${item[valueKey]} - ${item[labelKey] || item[valueKey]}`, item[valueKey]))
            .join("");

        field.innerHTML = includeAllLabel
            ? option(includeAllLabel, "") + options
            : options;

        if(current){
            field.value = current;
        }
    }

    function populateDatalist(id, items, valueKey, labelKey){
        const list = document.getElementById(id);

        if(!list){
            return;
        }

        list.innerHTML = items
            .map(item => `<option value="${item[valueKey]}" label="${item[labelKey] || item[valueKey]}"></option>`)
            .join("");
    }

    function populatePageControls(){
        populateSelect("activeStation", bases, "station_code", "display_name", "Todas as bases");
        populateSelect("activeAirline", airlines, "airline_code", "display_name", "Todas as cias");
        populateDatalist("stationOptions", bases, "station_code", "display_name");
        populateDatalist("airlineOptions", airlines, "airline_code", "display_name");
    }

    async function createBase(){
        const code = text(document.getElementById("newBaseCode")?.value);
        const name = document.getElementById("newBaseName")?.value.trim() || `${code} Training LL`;

        if(!code || code.length !== 3){
            throw new Error("Informe uma base com 3 letras, por exemplo GRU.");
        }

        const payload = {
            station_code: code,
            display_name: name,
            active: true
        };

        const { error } = await supabaseClient
            .from("simulator_bases")
            .upsert(payload, { onConflict:"station_code" });

        if(error){
            throw error;
        }

        await load();
        populatePageControls();
        return payload;
    }

    async function createAirline(){
        const code = text(document.getElementById("newAirlineCode")?.value);
        const name = document.getElementById("newAirlineName")?.value.trim() || `Airline ${code} Training`;

        if(!code || code.length < 2 || code.length > 3){
            throw new Error("Informe o código IATA da cia, por exemplo LA, G3, AA ou UA.");
        }

        const payload = {
            airline_code: code,
            display_name: name,
            active: true
        };

        const { error } = await supabaseClient
            .from("simulator_airlines")
            .upsert(payload, { onConflict:"airline_code" });

        if(error){
            throw error;
        }

        await load();
        populatePageControls();
        return payload;
    }

    function getActiveContext(){
        return {
            station: text(document.getElementById("activeStation")?.value),
            airline: text(document.getElementById("activeAirline")?.value)
        };
    }

    return {
        init,
        load,
        populatePageControls,
        createBase,
        createAirline,
        getActiveContext,
        bases: () => bases,
        airlines: () => airlines
    };
})();

window.SimulatorNetwork = SimulatorNetwork;
