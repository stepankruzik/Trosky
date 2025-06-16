// === MINIMAPA ===============================================================

// ---------------------------------------------------------------------------
// společné parametry
// ---------------------------------------------------------------------------
var map_sprite    = spr_track2;
var map_w         = sprite_get_width (map_sprite);
var map_h         = sprite_get_height(map_sprite);
var minimap_scale = 0.10;                 // 1/10 originálu
var minimap_w     = map_w * minimap_scale;
var minimap_h     = map_h * minimap_scale;

var border_thick  = 3;
var margin_right  = 20;                   // pro solo / ai
var margin_bottom = 20;

// manuální posun puntíků (zachováno)
var dot_off_x     = 0;
var dot_off_y     = 115;
var scale_factor  = 0.5;                  // rychlost teček

// ---------------------------------------------------------------------------
// KAM minimapu umístit?
// ---------------------------------------------------------------------------

var screen_x, screen_y;

if (global.game_mode == "mp")
{
    // **centrální** pozice (uprostřed dole) – IGNORUJE split kamery
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    screen_x = (gui_w - minimap_w) * 0.5;      // střed
    screen_y = gui_h - minimap_h - margin_bottom;
}
else
{
    // původní chování – pravý spodní roh hlavní kamery
    var cam = view_camera[0];
    var cam_x, cam_y;
    if (cam != -1)
    {
        cam_x = camera_get_view_x(cam);
        cam_y = camera_get_view_y(cam);
    }
    else
    {
        cam_x = view_xview[0];
        cam_y = view_yview[0];
    }

    screen_x = cam_x + camera_get_view_width (cam) - minimap_w - margin_right - 850; // tvoje offset_x
    screen_y = cam_y + camera_get_view_height(cam) - minimap_h - margin_bottom - 20; // tvoje offset_y
}

// ---------------------------------------------------------------------------
// kreslení rámečku + podkladu
// ---------------------------------------------------------------------------
draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(screen_x - border_thick, screen_y - border_thick,
               screen_x + minimap_w + border_thick,
               screen_y + minimap_h + border_thick, false);

draw_sprite_stretched(map_sprite, 0, screen_x, screen_y,
                      minimap_w, minimap_h);

// ---------------------------------------------------------------------------
// auta
// ---------------------------------------------------------------------------
var car1   = instance_find(obj_car,    0);   // hráč 1
var car2   = instance_find(obj_car_2,  0);   // hráč 2
var ai_car = instance_find(obj_ai_car, 0);   // AI

// hráč 1
if (car1 != noone)
{
    var mx1 = screen_x + (car1.x / map_w) * minimap_w * scale_factor + dot_off_x;
    var my1 = screen_y + (car1.y / map_h) * minimap_h * scale_factor + dot_off_y;
    draw_circle_color(mx1, my1, 4, c_red, c_red, false);
}

// hráč 2
if (car2 != noone)
{
    var mx2 = screen_x + (car2.x / map_w) * minimap_w * scale_factor + dot_off_x;
    var my2 = screen_y + (car2.y / map_h) * minimap_h * scale_factor + dot_off_y;
    draw_circle_color(mx2, my2, 4, c_lime, c_lime, false);
}

// AI
if (ai_car != noone)
{
    var mx3 = screen_x + (ai_car.x / map_w) * minimap_w * scale_factor + dot_off_x;
    var my3 = screen_y + (ai_car.y / map_h) * minimap_h * scale_factor + dot_off_y;
    draw_circle_color(mx3, my3, 4, c_yellow, c_yellow, false);
}
