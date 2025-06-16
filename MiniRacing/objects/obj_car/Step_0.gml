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

// --- Ovládání ---
if (can_move) {
    if (keyboard_check(vk_up)) speed += acceleration;
    if (keyboard_check(vk_down)) speed -= acceleration;

    if (speed > max_speed) speed = max_speed;
    if (speed < -max_speed * 0.5) speed = -max_speed * 0.5;

    if (keyboard_check(vk_left)) direction += turn_speed * (speed / max_speed);
    if (keyboard_check(vk_right)) direction -= turn_speed * (speed / max_speed);

    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);

    if (lap < max_laps) {
        lap_time += 1 / room_speed;
        total_time += 1 / room_speed;
    }
	// === Výpočet požadované hlasitosti podle rychlosti ===
var target_volume = clamp(abs(speed) / max_speed * 1.4, 0.1, 1.2);

// === Plynulé zesílení/zeslabení pomocí interpolace ===
engine_volume = lerp(engine_volume, target_volume, 0.05);

// === Nastavení hlasitosti zvuku ===
audio_sound_gain(snd_car4, engine_volume, 0);

audio_sound_gain(snd_music, 0.25, 0);
}

// --- Tření ---
speed = lerp(speed, 0, friction);

// --- Checkpoint systém ---
var cp = instance_place(x, y, obj_checkpoint);
if (cp != noone && cp.checkpoint_id == current_checkpoint && !cp.activated) {
    cp.activated = true;
    cp.sprite_index = spr_checkpoint_on;
    current_checkpoint++;
    show_debug_message("Checkpoint " + string(current_checkpoint - 1) + " aktivován");

    if (current_checkpoint >= total_checkpoints) {
        lap_times[lap] = lap_time;
        lap++;
        lap_time = 0;
        current_checkpoint = 0;

        with (obj_checkpoint) {
            activated = false;
            sprite_index = spr_checkpoint;
        }

        if (lap >= max_laps) {
            can_move = false;
            show_debug_message("Konec závodu! (car)");
        }
    }
}

// --- Terénní efekty ---
var gr = instance_place(x, y, obj_grass);
if (gr != noone) speed *= 0.5;

var bst = instance_place(x, y, obj_boost);
if (bst != noone) speed *= 1.5;

var br = instance_place(x, y, obj_barier);
if (br != noone) speed *= -0.4;

var by = instance_place(x, y, obj_tree);
if (by != noone) speed *= -0.4;

// --- Ghost data ---
lap_data[array_length(lap_data)] = [x, y, image_angle];

// --- Rotace auta ---
image_angle = direction;

// --- Kamera ---
camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0]) / 2, y - camera_get_view_height(view_camera[0]) / 2);


