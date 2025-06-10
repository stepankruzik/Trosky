// Výpočet natočení ručičky
var max_angle = 200;
var angle = clamp(abs(obj_car_2.speed) / obj_car_2.max_speed, 0, 1) * max_angle;

// Souřadnice středu tachometru
var cx = 200;
var cy = display_get_gui_height() - 200;

// Vykresli pozadí tachometru
draw_sprite_ext(spr_tacho, 0, cx, cy, 0.7, 0.7, 0, c_white, 1);

// Vykresli ručičku
draw_sprite_ext(spr_tacho_needle, 0, cx, cy, 0.7, 0.7, -angle, c_white, 1);

// Vykresli rychlost textově pod tachometr
var speed_text = string_format(abs(obj_car_2.speed) * 25, 0, 0) + " km/h"; 
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);draw_text_transformed(cx, cy + 70, speed_text, 2, 2, 0); // zvětšení 2x
