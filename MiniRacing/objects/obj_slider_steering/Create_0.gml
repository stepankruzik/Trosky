// Souřadnice a rozměry slideru
x = 80;
y = 190;

bar_x = x;
bar_y = y;
bar_width = 200;

// Výchozí hodnota
if (!variable_global_exists("steering_sensitivity")) {
    global.steering_sensitivity = 0.5;
}

value = global.steering_sensitivity;

// Detekce posunu myší
if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, bar_x, bar_y, bar_x + bar_width, bar_y + 20)) {
    value = clamp((mouse_x - bar_x) / bar_width, 0, 1);
    global.steering_sensitivity = value;
}
