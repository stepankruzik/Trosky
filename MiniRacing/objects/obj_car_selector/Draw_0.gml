draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Hlavní texty
draw_set_color(c_white);
draw_text(room_width/2, 50, "VYBER SI AUTO");
draw_text(room_width/2, 100, "← → pro výběr, ENTER pro start");

// Aktuální auto
var current_sprite = car_sprites[selected_index];
var car_width = sprite_get_width(current_sprite) * car_scale;
var car_height = sprite_get_height(current_sprite) * car_scale;

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

// Šipky
draw_set_color(c_black);
draw_text(car_x - 200, car_y, "◄");
draw_text(car_x + 200, car_y, "►");

// Název auta
var car_names = ["RED", "BLUE", "GREEN", "YELLOW"];
draw_text(car_x, car_y + car_height/2 + 100, car_names[selected_index]);