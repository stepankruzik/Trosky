if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, bar_x, bar_y, bar_x + bar_width, bar_y + bar_height)) {
        dragging = true;
    }
}

if (mouse_check_button_released(mb_left)) {
    dragging = false;
}

if (dragging) {
    value = clamp((mouse_x - bar_x) / bar_width, 0, 1);
}
audio_master_gain(value);
