// Načtení peněz ze souboru (nebo 0 pokud neexistuje)
ini_open("save.ini");
global.money = ini_read_real("wallet", "money", 0);
ini_close();

function add_money(amount) {
    global.money += amount;
    ini_open("save.ini");
    ini_write_real("wallet", "money", global.money);
    ini_close();
}

function remove_money(amount) {
    if (global.money >= amount) {
        global.money -= amount;
        ini_open("save.ini");
        ini_write_real("wallet", "money", global.money);
        ini_close();
        return true;
    } else {
        return false;
    }
}

// Inicializace tuningu (v Create Event)
if (!variable_global_exists("car_speed_upgrade_level")) {
    global.car_speed_upgrade_level = 0; // startovní level
}

if (!variable_global_exists("car_speed_upgrade_price")) {
    global.car_speed_upgrade_price = 500; // cena za první upgrade
}
