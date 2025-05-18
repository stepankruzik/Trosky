// Zastavení na začátku
if (!can_move) exit;

// Zastavit, pokud AI dokončilo závod nebo hráč vyhrál
if (lap >= max_laps || obj_car.lap >= max_laps) {
    can_move = false;
    exit;
}

// === Najít další AI trasový bod ===
if (target == noone || !instance_exists(target) || point_distance(x, y, target.x, target.y) < 16) {
    var next_id = current_checkpoint_path + 1;
    var found = false;

    with (obj_ai_path_point) {
        if (path_id == next_id) {
            other.target = id;
            other.current_checkpoint_path = next_id;
            found = true;
        }
    }

    // Konec trasy? Restartuj
    if (!found) {
        current_checkpoint_path = -1;
    }
}

// === Řízení k cíli ===
if (target != noone) {
    var target_dir = point_direction(x, y, target.x, target.y);
    var angle_diff = angle_difference(direction, target_dir);

    // Otáčení
    direction += clamp(angle_diff, -turn_speed, turn_speed);

    // Zrychlování
    if (abs(angle_diff) < 90) {
        speed += acceleration;
    } else {
        speed -= acceleration;
    }

    // Omezení rychlosti
    speed = clamp(speed, -max_speed * 0.5, max_speed);

    // Pohyb
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);

    // Tření
    speed = lerp(speed, 0, friction);
}

// === Hráčský checkpoint dosažen? ===
var cp = instance_place(x, y, obj_checkpoint);
if (cp != noone && cp.checkpoint_id == current_checkpoint) {
    current_checkpoint++;

    if (current_checkpoint >= total_checkpoints) {
        current_checkpoint = 0;
        lap += 1;
        lap_time = 0;

        if (lap >= max_laps) {
            can_move = false;
        }
    }
}

// === Povrchy ===
if (instance_place(x, y, obj_grass)) {
    speed *= 0.5;
}

if (instance_place(x, y, obj_boost)) {
    speed *= 1.5;
}

if (instance_place(x, y, obj_barier)) {
    speed *= -0.4;
}
