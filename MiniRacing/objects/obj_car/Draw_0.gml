draw_self();

if (variable_global_exists("player_name") && global.player_name != "") {
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    draw_text(x, y - sprite_height / 2 - 10, global.player_name);
}
