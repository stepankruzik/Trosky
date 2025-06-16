// -----------------------------------------------------------
// === MP (split‑screen) → jedna minimapa UPROSTŘED ==========
// -----------------------------------------------------------
if (global.game_mode == "mp")
{
    // --------------------------------------------------------
    // GUI rozměry
    // --------------------------------------------------------
    var scr_w = display_get_gui_width();
    var scr_h = display_get_gui_height();

    // --------------------------------------------------------
    // velikost minimapy
    // --------------------------------------------------------
    var map_sprite = spr_track2;
    var minimap_scale = 0.12;                     // 12 %  (klidně změň)
    var minimap_w  = sprite_get_width(map_sprite)  * minimap_scale;
    var minimap_h  = sprite_get_height(map_sprite) * minimap_scale;

    // --------------------------------------------------------
    // kam ji dát  (uprostřed dole, 20 px odspodu)
    // --------------------------------------------------------
    var sx = (scr_w - minimap_w) * 0.5;
    var sy = scr_h - minimap_h - 20;

    // --------------------------------------------------------
    // podklad + rámeček
    // --------------------------------------------------------
    var b = 3;
    draw_set_color(c_black);
    draw_rectangle(sx-b, sy-b, sx+minimap_w+b, sy+minimap_h+b, false);
    draw_sprite_stretched(map_sprite, 0, sx, sy, minimap_w, minimap_h);

    // --------------------------------------------------------
    // --- DŮLEŽITÉ: počátek sprite trati v roomu  -------------  // ★
    // --------------------------------------------------------
    // Pokud sprite "sedí" v (0,0) roomu, nechej 0.
    // Jinak sem napiš souřadnice levého‑horního rohu trati.
    //
    var track_origin_x = 350;   // např. -256  když je posunutá doleva 256 px
    var track_origin_y = -930;   // např. -128  když je výš o 128 px

    // --------------------------------------------------------
    // auta
    // --------------------------------------------------------
    var car1   = instance_find(obj_car,    0);   // hráč 1
    var car2   = instance_find(obj_car_2,  0);   // hráč 2
    var ai_car = instance_find(obj_ai_car, 0);   // AI

    var map_w_orig = sprite_get_width(map_sprite);
    var map_h_orig = sprite_get_height(map_sprite);

    // --------------------------------------------------------
    // ruční posun teček (dolů o pár px, ať nejsou přes trať)  // ★
    // --------------------------------------------------------
    var dot_off_x = 0;
    var dot_off_y = 8;   // zvedni/niž podle potřeby

    // --------------------------------------------------------
    // funkce na vykreslení tečky podle auta                   // ★
    // --------------------------------------------------------
 // --- upravená funkce (bere 2 nové argumenty navíc)
function _draw_dot(_car, _col, _origin_x, _origin_y, _map_w, _map_h, _sx, _sy, _minimap_w, _minimap_h, _dot_off_x, _dot_off_y)
{
    if (_car == noone) exit;

    var nx = clamp((_car.x - _origin_x) / _map_w, 0, 1);
    var ny = clamp((_car.y - _origin_y) / _map_h, 0, 1);

    var shrink = 0.90;
    nx = nx * shrink + (1 - shrink) * 0.5;
    ny = ny * shrink + (1 - shrink) * 0.5;

    var px = _sx + nx * _minimap_w + _dot_off_x;
    var py = _sy + ny * _minimap_h + _dot_off_y;

    draw_circle_color(px, py, 4, _col, _col, false);
}


var dot_off_x = 0;
var dot_off_y = 6;  // např. dolů pro zarovnání

// ...

_draw_dot(car1,   c_red,    track_origin_x, track_origin_y, map_w_orig, map_h_orig, sx, sy, minimap_w, minimap_h, dot_off_x, dot_off_y);
_draw_dot(car2,   c_lime,   track_origin_x, track_origin_y, map_w_orig, map_h_orig, sx, sy, minimap_w, minimap_h, dot_off_x, dot_off_y);
_draw_dot(ai_car, c_yellow, track_origin_x, track_origin_y, map_w_orig, map_h_orig, sx, sy, minimap_w, minimap_h, dot_off_x, dot_off_y);


}
