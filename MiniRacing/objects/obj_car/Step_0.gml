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

    
	if (lap < max_laps) {
        lap_time += 1/room_speed;
        total_time += 1/room_speed;
    }
}
//Tření (zpomalení)
speed = lerp(speed, 0, friction);


var cp = instance_place(x, y, obj_checkpoint);
if (cp != noone && cp.checkpoint_id == current_checkpoint && !cp.activated) {
    cp.activated = true;
    cp.sprite_index = spr_checkpoint_on;
    current_checkpoint++;
    
    show_debug_message("Checkpoint " + string(current_checkpoint-1) + " aktivován");

    // Kontrola kola
    if (current_checkpoint >= total_checkpoints) {
        lap_times[lap] = lap_time;
        lap++;
        lap_time = 0;
        current_checkpoint = 0;
        
        // Reset checkpointů
        with (obj_checkpoint) {
            activated = false;
            sprite_index = spr_checkpoint;
        }
        
        if (lap >= max_laps) {
            can_move = false;
            show_debug_message("Konec závodu!");
        }
    }
}


var gr = instance_place(x, y, obj_grass);
if(gr != noone){
speed *= 0.5;

}
var br = instance_place(x, y, obj_barier); //když narazí do briéry odrazí ho to
if (br != noone) {
  
    speed *= -0.4;

    // audio_play_sound(snd_bump, 1, false);
}


