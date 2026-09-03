import { supabase } from "./supabase.js";

/* =========================
   ADICIONAR AGENTE
========================= */
window.addAgent = async () => {

  const name = document.getElementById("name").value;

  if(!name){
    alert("Nome obrigatório");
    return;
  }

  await supabase
    .from("agents")
    .insert([{
      name,
      status: "livre",
      active_today: true
    }]);

  load();
};

/* =========================
   LISTAR AGENTES
========================= */
async function load(){

  const { data } = await supabase
    .from("agents")
    .select("*")
    .eq("active_today", true);

  const list = document.getElementById("list");
  list.innerHTML = "";

  data.forEach(a => {

    const div = document.createElement("div");
    div.className = "card";

    div.innerHTML = `
      <b>${a.name}</b><br>
      Status: ${a.status}
    `;

    list.appendChild(div);
  });
}

/* realtime */
supabase
  .channel("admin_agents")
  .on("postgres_changes",
    { event:"*", schema:"public", table:"agents" },
    () => load()
  )
  .subscribe();

load();