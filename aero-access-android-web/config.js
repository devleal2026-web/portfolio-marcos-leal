export const SUPABASE_URL = "https://lxvoozrtmbqsrgxbajgp.supabase.co";
export const SUPABASE_KEY = "sb_publishable_LZZBL6xGA9htJykg29sLQA_UOf249RM";

export async function selectOne(table, filters) {
    const params = new URLSearchParams();
    params.set("select", "*");
    params.set("limit", "1");

    Object.entries(filters).forEach(([key, value]) => {
        params.set(key, `eq.${value}`);
    });

    const response = await fetch(`${SUPABASE_URL}/rest/v1/${table}?${params.toString()}`, {
        method: "GET",
        headers: {
            apikey: SUPABASE_KEY,
            Authorization: `Bearer ${SUPABASE_KEY}`
        }
    });

    if (!response.ok) {
        const text = await response.text();
        throw new Error(`${response.status} - ${text}`);
    }

    const data = await response.json();
    return data[0] || null;
}

export async function updateById(table, id, values) {
    const response = await fetch(`${SUPABASE_URL}/rest/v1/${table}?id=eq.${id}`, {
        method: "PATCH",
        headers: {
            apikey: SUPABASE_KEY,
            Authorization: `Bearer ${SUPABASE_KEY}`,
            "Content-Type": "application/json",
            Prefer: "return=minimal"
        },
        body: JSON.stringify(values)
    });

    if (!response.ok) {
        const text = await response.text();
        throw new Error(`${response.status} - ${text}`);
    }
}