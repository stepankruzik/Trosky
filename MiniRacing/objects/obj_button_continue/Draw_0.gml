draw_set_alpha(1);
draw_set_color(hover ? c_lime : c_gray); // efekt najetí
draw_roundrect(x, y, x + width, y + height, false);

// Text
draw_set_font(fnt_esc);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + width/2, y + height/2, text);
