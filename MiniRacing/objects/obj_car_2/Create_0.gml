depth = -10;

// Pohybové proměnné
speed = 0;
direction = 270;
acceleration = 0.2;
max_speed = 5;
friction = 0.05;
turn_speed = 4;

// Checkpointy
current_checkpoint = 0;
total_checkpoints = 8; // Nastav skutečný počet
lap = 0;
max_laps = 3;

// Časovače
lap_times = array_create(max_laps, 0);
lap_time = 0;
total_time = 0;
can_move = false;

//ghost
lap_data = []; // Pole na souřadnice pro ghost
race_started = false;

// Nastaví auto na vybraný sprite
sprite_index = spr_car_green;

//  Zmenšení auta na 50 %
image_xscale = 0.092;
image_yscale = 0.092;

// --- Převzetí hráčových upgradů ---
if (variable_global_exists("upgrade_max_speed")) max_speed += global.upgrade_max_speed;
if (variable_global_exists("upgrade_acceleration")) acceleration += global.upgrade_acceleration;
if (variable_global_exists("upgrade_turn")) turn_speed += global.upgrade_turn;
if (variable_global_exists("upgrade_speed")) max_speed += global.upgrade_speed;
