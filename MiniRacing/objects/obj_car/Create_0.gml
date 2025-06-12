depth = -10;

// Pohybové proměnné - základní hodnoty
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

// Ghost
lap_data = [];
race_started = false;

// Nastaví auto na vybraný sprite
sprite_index = global.selected_car_sprite;

// Zmenšení auta na 9.2 %
image_xscale = 0.092;
image_yscale = 0.092;

base_speed = max_speed;
boost_active = false;
boost_timer = 0;
boost_duration = 50 * room_speed;    // 10 sekund boost
boost_cooldown = 15 * room_speed;    // např. 15 sekund cooldown
boost_cooldown_timer = 0;


// Přičtení upgradů k základním hodnotám (pokud existují)
if (variable_global_exists("upgrade_max_speed")) max_speed += global.upgrade_max_speed;
if (variable_global_exists("upgrade_acceleration")) acceleration += global.upgrade_acceleration;
if (variable_global_exists("upgrade_turn")) turn_speed += global.upgrade_turn;
if (variable_global_exists("upgrade_speed")) max_speed += global.upgrade_speed; // pokud je to samostatný upgrade rychlosti

//Boost
boost_active = false;
boost_duration = 30;     // trvání boostu (např. 30 stepů = 0.5 sekundy při 60 FPS)
boost_timer = 0;

boost_cooldown = 90;     // cooldown mezi boosty (např. 1.5 sekundy)
boost_cooldown_timer = 0;

engine_volume = 0; // počáteční hlasitost motoru
audio_play_sound(snd_car4, 1, true); // spustit zvuk motoru ve smyčce hned na začátku
audio_sound_gain(snd_car4, 0, 0); // začít potichu
