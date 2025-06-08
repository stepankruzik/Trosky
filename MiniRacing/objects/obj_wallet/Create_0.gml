// Otevři INI soubor
ini_open("save.ini");

// Načti nebo nastav výchozí hodnoty (pokud tam nic není)
global.money = ini_read_real("player", "money", 0);

global.upgrade_speed = ini_read_real("upgrades", "speed", 0);
global.upgrade_acceleration = ini_read_real("upgrades", "acceleration", 0);
global.upgrade_max_speed = ini_read_real("upgrades", "max_speed", 0);
global.upgrade_turn = ini_read_real("upgrades", "turn", 0);

// Zavři INI soubor
ini_close();


// Inicializace tuningu (pokud ještě neexistují globální proměnné)
if (!variable_global_exists("car_speed_upgrade_level")) {
    global.car_speed_upgrade_level = 0; // startovní level
}
if (!variable_global_exists("car_speed_upgrade_price")) {
    global.car_speed_upgrade_price = 500; // cena za první upgrade
}

persistent = true;
ini_open("save.ini");

ini_write_real("player", "money", global.money);
ini_write_real("upgrades", "speed", global.upgrade_speed);
ini_write_real("upgrades", "acceleration", global.upgrade_acceleration);
ini_write_real("upgrades", "max_speed", global.upgrade_max_speed); // POZOR na _ v názvu
ini_write_real("upgrades", "turn", global.upgrade_turn);

ini_close();
function add_money(amount) {
    global.money += amount;
    ini_open("save.ini");
    ini_write_real("player", "money", global.money);
    ini_close();
}

function remove_money(amount) {
    if (global.money >= amount) {
        global.money -= amount;
        ini_open("save.ini");
        ini_write_real("player", "money", global.money);
        ini_close();
        return true;
    } else {
        return false;
    }
}
