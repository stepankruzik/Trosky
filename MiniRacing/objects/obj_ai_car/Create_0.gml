// --- Startovní proměnné ---
current_checkpoint = 0; // pro hráčovy checkpointy
current_checkpoint_path = -1; // Začneme od path_id = 0
target = noone;

speed = 0;
direction = 270; // uprav podle směru na startu
acceleration = 0.2;
max_speed = 4;
turn_speed = 4;
friction = 0.05;

lap = 0;
max_laps = 3;
lap_times = array_create(max_laps, 0);
lap_time = 0;
total_time = 0;

can_move = false; // AI čeká na odpočet

// --- Počet hráčových checkpointů (pro kola) ---
total_checkpoints = 0;
with (obj_checkpoint) {
    if (checkpoint_id >= other.total_checkpoints) {
        other.total_checkpoints = checkpoint_id + 1;
    }
}

// --- Navigační body pro AI (obj_ai_path_point) ---
ai_checkpoint = 0;
total_ai_checkpoints = 0;
with (obj_ai_path_point) {
    if (path_id >= other.total_ai_checkpoints) {
        other.total_ai_checkpoints = path_id + 1;
    }
}

// --- Sprite a hloubka ---
sprite_index = spr_car_yellow; // změň dle potřeby
depth = -10;

//  Zmenšení auta na 50 %
image_xscale = 0.092;
image_yscale = 0.092;