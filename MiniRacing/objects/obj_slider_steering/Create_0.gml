x = 80;
y = 190;

if (!variable_global_exists("steering_sensitivity")) global.steering_sensitivity = 0.5;
if (!variable_global_exists("use_wasd")) {
    global.use_wasd = true; // nebo false podle výchozího ovládání
}
if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, bar_x, bar_y, bar_x + bar_width, bar_y + 20)) {
    value = clamp((mouse_x - bar_x) / bar_width, 0, 1);
    global.steering_sensitivity = value;
}

bar_x = x;
bar_width = 200;
value = global.steering_sensitivity;

bar_y = y;



if (!variable_global_exists("steering_sensitivity")) {
    global.steering_sensitivity = value;
} else {
    value = global.steering_sensitivity;
}
