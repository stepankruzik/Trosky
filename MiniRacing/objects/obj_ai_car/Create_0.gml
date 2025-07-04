// --- Startovní proměnné ---
current_checkpoint = 0; // pro hráčovy checkpointy
current_checkpoint_path = -1; // AI path_id
target = noone;

speed = 0;
direction = 270; // uprav dle startovní pozice
acceleration = 0.2;
max_speed = 4;
turn_speed = 4;
friction = 0.05;

lap = 0;
max_laps = 3;
lap_times = array_create(max_laps, 0);
lap_time = 0;
total_time = 0;

can_move = false; // AI čeká na start

// --- Počet hráčových checkpointů ---
total_checkpoints = 8;

// --- Navigační body pro AI (obj_ai_path_point) ---
ai_checkpoint = 0;
total_ai_checkpoints = 0;
with (obj_ai_path_point) {
    if (path_id >= other.total_ai_checkpoints) {
        other.total_ai_checkpoints = path_id + 1;
    }
}

// --- Převzetí hráčových upgradů ---
if (variable_global_exists("upgrade_max_speed")) max_speed += global.upgrade_max_speed;
if (variable_global_exists("upgrade_acceleration")) acceleration += global.upgrade_acceleration;
if (variable_global_exists("upgrade_turn")) turn_speed += global.upgrade_turn;
if (variable_global_exists("upgrade_speed")) max_speed += global.upgrade_speed;

// --- Výhoda AI (volitelné) ---
max_speed *= 2;
acceleration *= 2;
turn_speed *= 1.8;

// --- Sprite a měřítko ---
sprite_index = spr_car_yellow;
depth = -10;
image_xscale = 0.092;
image_yscale = 0.092;
