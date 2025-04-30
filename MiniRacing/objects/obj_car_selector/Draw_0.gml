draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(f_carmenutext)

// Hlavní texty
draw_set_color(c_white);
var text_y = 50;
draw_text(room_width/2, text_y, "VYBER SI AUTO");
draw_text(room_width/2, text_y + 150, "POUZIJ SIPKY PRO VYBER, ENTER PRO START");

// Aktuální auto
var current_sprite = car_sprites[selected_index];
var car_scale = 35;
var car_x = 700;
var car_y = text_y + 150; // 150px pod posledním textem

// Vykreslení auta
draw_sprite_ext(
    current_sprite,
    0,
    car_x,
    car_y,
    car_scale,
    car_scale,
    0,
    c_white,
    1
);

