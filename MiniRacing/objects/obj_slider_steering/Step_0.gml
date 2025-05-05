if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, bar_x, y, bar_x + bar_width, y + 16)) {
value = clamp((mouse_x - bar_x) / bar_width, 0, 1);
global.steering_sensitivity = value;
}