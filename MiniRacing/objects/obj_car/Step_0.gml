// obj_car - Step Event

// Ovládání auta
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

//Tření (zpomalení)
speed = lerp(speed, 0, friction);
