import { createClient } from "https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm";

const supabaseUrl = "https://lxvoozrtmbqsrgxbajgp.supabase.co";
const supabaseKey = "sb_publishable_LZZBL6xGA9htJykg29sLQA_UOf249RM";

export const supabase = createClient(supabaseUrl, supabaseKey);