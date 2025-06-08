ini_open("save.ini");

// Nastav defaultní hodnoty
ini_write_real("player", "money", 500);

ini_write_real("upgrades", "speed", 0);
ini_write_real("upgrades", "acceleration", 0);
ini_write_real("upgrades", "max_speed", 0);
ini_write_real("upgrades", "turn", 0);

ini_close();

// A taky vyresetuj globální proměnné, aby byly aktuální v běhu hry
global.money = 500;
global.upgrade_speed = 0;
global.upgrade_acceleration = 0;
global.upgrade_max_speed = 0;
global.upgrade_turn = 0;
