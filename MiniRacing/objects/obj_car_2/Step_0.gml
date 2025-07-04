// Upgradované hodnoty vždy nastavíme z globálních + základních, abychom měli aktuální hodnoty (lepší než měnit jen v Create)
var base_max_speed = 10;
var base_acceleration = 0.5;
var base_turn_speed = 8;
var base_friction = 0.10;

max_speed = base_max_speed;
acceleration = base_acceleration;
turn_speed = base_turn_speed;
friction = base_friction;

// Přičti globální upgrady pokud existují
if (variable_global_exists("upgrade_max_speed")) max_speed += global.upgrade_max_speed;
if (variable_global_exists("upgrade_acceleration")) acceleration += global.upgrade_acceleration;
if (variable_global_exists("upgrade_turn")) turn_speed += global.upgrade_turn;
if (variable_global_exists("upgrade_speed")) max_speed += global.upgrade_speed;

// Speciální upgrady
if (variable_global_exists("upgrade_turbo") && global.upgrade_turbo) {
    max_speed += 2; // turbo boost
}
if (variable_global_exists("upgrade_tires") && global.upgrade_tires) {
    friction = 0.08;
    turn_speed += 1;
}
if (variable_global_exists("upgrade_brakes") && global.upgrade_brakes) {
    if (keyboard_check(vk_down)) {
        friction = 0.2; // silnější brzdění
    } else if (!(variable_global_exists("upgrade_tires") && global.upgrade_tires)) {
        friction = base_friction;
    }
}

if (can_move) {
    // Ovládání (WSAD)
    if (keyboard_check(ord("W"))) speed += acceleration;
    if (keyboard_check(ord("S"))) speed -= acceleration;

    // Omezení rychlosti
    if (speed > max_speed) speed = max_speed;
    if (speed < -max_speed * 0.5) speed = -max_speed * 0.5;

    // Otáčení (jen při pohybu)
    if (keyboard_check(ord("A"))) direction += turn_speed * (speed / max_speed);
    if (keyboard_check(ord("D"))) direction -= turn_speed * (speed / max_speed);

    // Pohyb auta
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);

    // Čas kola a závodu
    if (lap < max_laps) {
        lap_time += 1 / room_speed;
        total_time += 1 / room_speed;
    }
}

// Tření
speed = lerp(speed, 0, friction);

// === Checkpoint ===
var cp = instance_place(x, y, obj_checkpoint_mp);
if (cp != noone && cp.checkpoint_id == current_checkpoint && !cp.activated) {
    cp.activated = true;
    cp.sprite_index = spr_checkpoint_mp_on;
    current_checkpoint++;
    show_debug_message("Checkpoint " + string(current_checkpoint - 1) + " aktivován");

    if (current_checkpoint >= total_checkpoints) {
        lap_times[lap] = lap_time;
        lap++;
        lap_time = 0;
        current_checkpoint = 0;

        // Reset checkpointů
        with (obj_checkpoint_mp) {
            activated = false;
            sprite_index = spr_checkpoint_mp;
        }

        if (lap >= max_laps) {
            can_move = false;
            show_debug_message("Konec závodu! (car_2)");
        }
    }
}

// === Tráva ===
var gr = instance_place(x, y, obj_grass);
if (gr != noone) {
    speed *= 0.5;
}

// === Boost ===
var bst = instance_place(x, y, obj_boost);
if (bst != noone) {
    speed *= 1.5;
}

// === Bariéra ===
var br = instance_place(x, y, obj_barier);
if (br != noone) {
    speed *= -0.4;
    // audio_play_sound(snd_bump, 1, false); // Volitelný zvuk nárazu
}
var bg = instance_place(x, y, obj_tree);
if (bg != noone) speed *= -0.4;

var ba = instance_place(x, y, obj_tree_2);
if (ba != noone) speed *= -0.4;

var bx = instance_place(x, y, obj_cone);
if (bx != noone) speed *= -0.4;

var bf = instance_place(x, y, obj_tyre);
if (bf != noone) speed *= -0.4;


// === Ghost recording (volitelné) ===
lap_data[array_length(lap_data)] = [x, y, image_angle];

// Nastavení rotace obrázku podle směru jízdy
image_angle = direction;

camera_set_view_pos(view_camera[1], x - camera_get_view_width(view_camera[1]) / 2, y - camera_get_view_height(view_camera[1]) / 2);