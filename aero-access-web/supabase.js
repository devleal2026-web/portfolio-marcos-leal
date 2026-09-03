import { createClient } from "https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm";

const supabaseUrl = "https://pqhuvakeolsogczfbynb.supabase.co";
const supabaseKey = "sb_publishable_kzOKlRBSbEU23lg53K9DnA_0qwAlGKo";

export const supabase = createClient(supabaseUrl, supabaseKey);