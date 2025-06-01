// === MINIMAPA ===

// Kamera (fallback pro případ, že kamera není nastavena)
var cam = view_camera[0];
var cam_x, cam_y;

if (cam != -1) {
    cam_x = camera_get_view_x(cam);
    cam_y = camera_get_view_y(cam);
} else {
    cam_x = view_xview[0];
    cam_y = view_yview[0];
}

// Velikost mapy podle sprite
var map_w = sprite_get_width(spr_track2);
var map_h = sprite_get_height(spr_track2);

// Velikost minimapy (1/10 originální velikosti)
var minimap_w = map_w / 10;
var minimap_h = map_h / 10;

// Manuální posun minimapy po pixelech (nastav podle potřeby)
var offset_x = -850;  // posun celé minimapy doleva
var offset_y = -20;    // posun celé minimapy dolů

// Ruční doladění pozice puntíků (nastav podle potřeby)
var offset_puntik1_x = 0;    // (hráč 1)
var offset_puntik1_y = 115;

var offset_puntik2_x = 0;    //  (hráč 2)
var offset_puntik2_y = 115;

var offset_ai_x = 0;         //  (AI)
var offset_ai_y = 115;

// Výpočet pozice minimapy na obrazovce
var margin = 20;
var screen_x = cam_x + camera_get_view_width(cam) - minimap_w - margin + offset_x;
var screen_y = cam_y + camera_get_view_height(cam) - minimap_h - margin + offset_y;

// Rámeček kolem minimapy
var border_thickness = 3;
draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(
    screen_x - border_thickness,
    screen_y - border_thickness,
    screen_x + minimap_w + border_thickness,
    screen_y + minimap_h + border_thickness,
    false // false = není vyplněný, jen rámeček
);

// Vykreslení pozadí minimapy
draw_sprite_stretched(spr_track2, 0, screen_x, screen_y, minimap_w, minimap_h);

// Najdi auta
var car1 = instance_find(obj_car, 0);
var car2 = instance_find(obj_car_2, 0);
var ai_car = instance_find(obj_ai_car, 0);


// Hráč 1 
if (car1 != noone) {
    var scale_factor = 0.5;
    var mini_x1 = screen_x + (car1.x / map_w) * minimap_w * scale_factor + offset_puntik1_x;
    var mini_y1 = screen_y + (car1.y / map_h) * minimap_h * scale_factor + offset_puntik1_y;
    draw_circle_color(mini_x1, mini_y1, 4, c_red, c_red, false);
}

// Hráč 2 
if (car2 != noone) {
	 var scale_factor = 0.5;
    var mini_x2 = screen_x + (car2.x / map_w) * minimap_w  * scale_factor + offset_puntik2_x;
    var mini_y2 = screen_y + (car2.y / map_h) * minimap_h  * scale_factor + offset_puntik2_y;
    draw_circle_color(mini_x2, mini_y2, 4, c_lime, c_lime, false);
}

// AI 
if (ai_car != noone) {
	 var scale_factor = 0.5;
    var mini_x3 = screen_x + (ai_car.x / map_w) * minimap_w  * scale_factor + offset_ai_x;
    var mini_y3 = screen_y + (ai_car.y / map_h) * minimap_h  * scale_factor + offset_ai_y;
    draw_circle_color(mini_x3, mini_y3, 4, c_yellow, c_yellow, false);
}
