// AI startovací proměnné
current_checkpoint = 0;
target = noone;

speed = 0;
direction = 270; // Pokud startuje směrem dolů – uprav podle mapy
acceleration = 0.2;
max_speed = 4;
turn_speed = 4;
friction = 0.05;

lap = 0;
max_laps = 3;
lap_times = array_create(max_laps, 0);
lap_time = 0;
total_time = 0;

can_move = false; // AI čeká na start odpočítání

// Počet checkpointů automaticky spočítat
total_checkpoints = 0;
with (obj_checkpoint) {
    if (checkpoint_id >= other.total_checkpoints) {
        other.total_checkpoints = checkpoint_id + 1;
    }
}

// Sprite AI auta (může být stejný nebo vlastní)
sprite_index = spr_car_yellow; // nebo nahraď spr_ai_car jiným spritem

// Kreslení nad jinými objekty
depth = -10;
