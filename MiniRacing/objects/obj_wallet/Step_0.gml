// STEP EVENT – obj_wallet

// Zajištění existence globální proměnné pro peníze
if (!variable_global_exists("money")) {
    global.money = 0;
}

// Můžeš zde také kontrolovat nebo zpracovávat jiné věci týkající se peněz (např. úrok, spoření, atd.)
// Pro jednoduchost se zde peníze jen sledují
