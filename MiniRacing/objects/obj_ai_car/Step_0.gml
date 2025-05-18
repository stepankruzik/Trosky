// Step Event AI auta
if (!can_move) exit; // ← musí být jako první věc ve Step Eventu!

// Pokud AI dokončilo závod nebo hráč vyhrál, tak se nehýbej
if (lap >= max_laps || obj_car.lap >= max_laps) {
    can_move = false;
    exit; // zastav vše ostatní ve Step eventu
}

// Najít další checkpoint
if (target == noone || !instance_exists(target) || point_distance(x, y, target.x, target.y) < 16) {
    with (obj_checkpoint) {
        if (checkpoint_id == other.current_checkpoint) {
            other.target = id;
        }
    }
}

// Pokud máme cíl
if (target != noone) {
    // Úhel směrem k cíli
    var target_dir = point_direction(x, y, target.x, target.y);
    var angle_diff = angle_difference(direction, target_dir);

    // Otáčení směrem k cíli
    direction += clamp(angle_diff, -turn_speed, turn_speed);

    // Zrychlení vpřed
    if (abs(angle_diff) < 90) {
        speed += acceleration;
    } else {
        speed -= acceleration;
    }

    // Omez rychlost
    speed = clamp(speed, -max_speed * 0.5, max_speed);

    // Pohyb
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);

    // Tření
    speed = lerp(speed, 0, friction);

    // Checkpoint dosažen?
    if (point_distance(x, y, target.x, target.y) < 16) {
        current_checkpoint += 1;
        if (current_checkpoint >= total_checkpoints) {
            current_checkpoint = 0;
        }
    }
}

// Grass
if (instance_place(x, y, obj_grass)) {
    speed *= 0.5;
}

// Boost
if (instance_place(x, y, obj_boost)) {
    speed *= 1.5;
}

// Bariéra
if (instance_place(x, y, obj_barier)) {
    speed *= -0.4;
}
