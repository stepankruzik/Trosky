draw_set_font(fnt_esc);
draw_set_color(c_white);
draw_text(100, 100, "Zvol si režim:");

for (var i = 0; i < array_length(options); i++) {
    var ox = start_x;
    var oy = start_y + i * spacing;

    var is_hover = point_in_rectangle(mouse_x, mouse_y, ox, oy, ox + option_width, oy + option_height);
    draw_set_color(is_hover ? c_lime : c_gray);
    draw_rectangle(ox, oy, ox + option_width, oy + option_height, false);

    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    draw_text(ox + 10, oy + option_height / 2, options[i]);
}
