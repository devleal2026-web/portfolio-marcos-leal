/*==========================================================
ACADEMY SUPABASE LOADER
Carrega cursos do Supabase com fallback para os arquivos locais.
==========================================================*/

"use strict";

async function loadAcademyFromSupabase(){
    if(typeof supabaseClient === "undefined" || !supabaseClient){
        return false;
    }

    const { data, error } = await supabaseClient
        .from("academy_courses")
        .select("*")
        .order("sort_order", { ascending:true });

    if(error){
        console.warn("Academy Supabase fallback:", error.message);
        return false;
    }

    if(!Array.isArray(data) || data.length === 0){
        return false;
    }

    const remoteCourses = data
        .filter(row => row && row.id && row.title)
        .map(row => ({
        id: row.id,
        title: row.title,
        eyebrow: row.eyebrow,
        category: row.category,
        duration: row.duration,
        level: row.level,
        summary: row.summary,
        color: row.color,
        modules: Array.isArray(row.modules) ? row.modules : [],
        labs: Array.isArray(row.labs) ? row.labs : [],
        quiz: Array.isArray(row.quiz) ? row.quiz : [],
        coverPath: row.cover_path || "",
        material: row.material || ""
    }));

    if(remoteCourses.length === 0){
        console.warn("Academy Supabase fallback: nenhum curso remoto valido.");
        return false;
    }

    academyCourses.splice(0, academyCourses.length, ...remoteCourses);

    if(typeof academyMaterials !== "undefined"){
        Object.keys(academyMaterials).forEach(key => delete academyMaterials[key]);

        data.forEach(row => {
            academyMaterials[row.id] = row.material || "";
        });
    }

    window.academyDataSource = "supabase";
    return true;
}



