options = ["Solo (časovka)", "Závod proti AI", "Multiplayer"];
start_x = 120;
start_y = 160;
spacing = 40;
option_width = 300;
option_height = 40;
 global.rezim = "";
// v obj_race_controller → Create Event
global.can_move = false;
global.max_laps = 3; // jen pokud chceš globální verzi

var start_x1 = 640;
var start_y1 = 421;


var start_x2 = 640;
var start_y2 = 521;

if (global.game_mode == "solo") {
    player = instance_create_layer(start_x1, start_y1, "Instances", obj_car); // Jen jedno auto
}

if (global.game_mode == "ai") {
    player = instance_create_layer(start_x1, start_y1, "Instances", obj_car);
    ai = instance_create_layer(start_x2, start_y2, "Instances", obj_ai_car);
}

if (global.game_mode == "mp") {
    player1 = instance_create_layer(start_x1, start_y1, "Instances", obj_car);    // Šipky
    player2 = instance_create_layer(start_x2, start_y2, "Instances", obj_car_2);
 // WASD
}

