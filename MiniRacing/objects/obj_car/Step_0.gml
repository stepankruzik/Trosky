// Ovládání auta
if (can_move) {
if (keyboard_check(vk_up)) {
    speed += acceleration;
}
if (keyboard_check(vk_down)) {
    speed -= acceleration;
}

// Omezení rychlosti
if (speed > max_speed) {
    speed = max_speed;
}
if (speed < -max_speed * 0.5) {
    speed = -max_speed * 0.5;
}

// Otáčení jen při pohybu
if (keyboard_check(vk_left)) {
    direction -= turn_speed * (speed / max_speed);
}
if (keyboard_check(vk_right)) {
    direction += turn_speed * (speed / max_speed);
}

// Pohyb auta
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);
}
//Tření (zpomalení)
speed = lerp(speed, 0, friction);


var cp = instance_place(x, y, obj_checkpoint);
if (cp != noone && cp.checkpoint_id == current_checkpoint && !cp.activated) {
    // Aktivace checkpointu
    cp.activated        = true;
    cp.activation_timer = cp.activation_time_max;
    cp.sprite_index     = spr_checkpoint_on; // Změna sprite na aktivovaný

    // Posun na další checkpoint
    current_checkpoint += 1;
    show_debug_message("Projet checkpoint " + string(cp.checkpoint_id));

    // Kontrola dokončení kola
    if (current_checkpoint >= total_checkpoints) {
        lap += 1;
        current_checkpoint = 0;
        show_debug_message("Dokončeno kolo " + string(lap));

        // Reset všech checkpointů
        with (obj_checkpoint) {
            activated = false;
            activation_timer = 0;
            sprite_index = spr_checkpoint;
        }
    }
}

var gr = instance_place(x, y, obj_grass);
if(gr != noone){
speed *= 0.5;

}