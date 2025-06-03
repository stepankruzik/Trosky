// Při změně auta
if (keyboard_check_pressed(vk_right)) {
    target_x = room_width + 300; // Animace výjezdu vpravo
    alarm[0] = 10; // Zpoždění pro změnu auta
}

if (keyboard_check_pressed(vk_left)) {
    target_x = -300; // Animace výjezdu vlevo
    alarm[1] = 10; // Zpoždění pro změnu auta
}

// Animace
current_x += (target_x - current_x) / animation_speed;

// Ulož výběr
global.selected_car_sprite = car_sprites[selected_index];

// Spuštění závodu klávesou Enter
if (keyboard_check_pressed(vk_enter)) {
    if (global.game_mode = "mp") {
        room_goto(Room2); // Multiplayer místnost se 2 kamerami
    } else {
        room_goto(Room2_solo); // Solo nebo AI režim – místnost s 1 kamerou
    }
}
