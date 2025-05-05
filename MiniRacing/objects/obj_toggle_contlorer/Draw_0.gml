// Barva pozadí
draw_set_color(hovered ? c_lime : c_gray);
draw_roundrect(x, y, x + 160, y + 40, false);

// Text vycentrován doprostřed
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + 80, y + 20, "Ovladani: " + (global.control_scheme == 0 ? "Sipky" : "WASD"));

// Reset zarovnání
draw_set_halign(fa_left);
draw_set_valign(fa_top);
