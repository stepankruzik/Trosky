// Hover efekt
hovered = point_in_rectangle(mouse_x, mouse_y, x, y, x + 160, y + 40);

if (mouse_check_button_pressed(mb_left) && hovered) {
    global.control_scheme = 1 - global.control_scheme;
}
