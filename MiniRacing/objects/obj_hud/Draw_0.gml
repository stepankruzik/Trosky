// Kamera - střed obrazovky
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var center_x = cam_x + camera_get_view_width(cam) / 2;
var base_y = cam_y + camera_get_view_height(cam) - 110; // 110 px odspodu

var offset_x = 120; // vzdálenost vedle sebe

// Formátovací funkce
function format_time(t) {
    var mins = floor(t / 60);
    var secs = floor(t % 60);
    var cents = floor((t - floor(t)) * 100);
    return string_format(mins, 2, 0) + ":" + string_format(secs, 2, 0) + ":" + string_format(cents, 2, 0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_esc); // tady používáme font fnt_esc

if (global.game_mode == "solo") {
    var car = instance_find(obj_car, 0);
    if (car != noone) {
        draw_text(center_x - 100, base_y, 
                  "Solo režim\nHráč - Kolo: " + string(car.lap + 1) + "/" + string(car.max_laps) +
                  "\nČas: " + format_time(car.lap_time));
        if (car.lap >= car.max_laps) {
            draw_text(center_x - 100, base_y + 60, "FINISH HRÁČ\nCelkový čas: " + format_time(car.total_time));
            for (var i = 0; i < car.max_laps; i++) {
                draw_text(center_x - 100, base_y + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car.lap_times[i]));
            }
        }
    }
}
else if (global.game_mode == "ai") {
    var offset_x = 130;
    var car = instance_find(obj_car, 0);
    var ai = instance_find(obj_ai_car, 0);
    if (car != noone) {
        draw_text(center_x - offset_x, base_y, 
                  "Hráč - Kolo: " + string(car.lap + 1) + "/" + string(car.max_laps) +
                  "\nČas: " + format_time(car.lap_time));
        if (car.lap >= car.max_laps) {
            draw_text(center_x - offset_x, base_y + 60, "FINISH HRÁČ\nCelkový čas: " + format_time(car.total_time));
            for (var i = 0; i < car.max_laps; i++) {
                draw_text(center_x - offset_x, base_y + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car.lap_times[i]));
            }
        }
    }
    if (ai != noone) {
        draw_text(center_x + offset_x, base_y, 
                  "AI - Kolo: " + string(ai.lap + 1) + "/" + string(ai.max_laps) +
                  "\nČas: " + format_time(ai.lap_time));
        if (ai.lap >= ai.max_laps) {
            draw_text(center_x + offset_x, base_y + 60, "FINISH AI\nCelkový čas: " + format_time(ai.total_time));
            for (var i = 0; i < ai.max_laps; i++) {
                draw_text(center_x + offset_x, base_y + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(ai.lap_times[i]));
            }
        }
    }
}
else if (global.game_mode == "mp") {
   var offset_x = 130;
    var car1 = instance_find(obj_car, 0);
    var car2 = instance_find(obj_car_2, 0);

    if (car1 != noone) {
        draw_text(center_x - offset_x, base_y, 
                  "Hráč 1 - Kolo: " + string(car1.lap + 1) + "/" + string(car1.max_laps) +
                  "\nČas: " + format_time(car1.lap_time));
        if (car1.lap >= car1.max_laps) {
            draw_text(center_x - offset_x, base_y + 60, "FINISH Hráč 1\nCelkový čas: " + format_time(car1.total_time));
            for (var i = 0; i < car1.max_laps; i++) {
                draw_text(center_x - offset_x, base_y + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car1.lap_times[i]));
            }
        }
    }

    if (car2 != noone) {
        draw_text(center_x + offset_x, base_y, 
                  "Hráč 2 - Kolo: " + string(car2.lap + 1) + "/" + string(car2.max_laps) +
                  "\nČas: " + format_time(car2.lap_time));
        if (car2.lap >= car2.max_laps) {
            draw_text(center_x + offset_x, base_y + 60, "FINISH Hráč 2\nCelkový čas: " + format_time(car2.total_time));
            for (var i = 0; i < car2.max_laps; i++) {
                draw_text(center_x + offset_x, base_y + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car2.lap_times[i]));
            }
        }
    }
}