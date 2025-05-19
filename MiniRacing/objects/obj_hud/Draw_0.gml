draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(-1);

// Formátovací funkce
function format_time(t) {
    var mins = floor(t / 60);
    var secs = floor(t % 60);
    var cents = (t - floor(t)) * 100;
    return string_format(mins, 2, 0) + ":" + string_format(secs, 2, 0) + ":" + string_format(cents, 2, 0);
}

// === HRÁČ ===
var car = instance_find(obj_car, 0);
if (car != noone) {
    draw_text(10, 10, "Hráč - Kolo: " + string(car.lap + 1) + "/" + string(car.max_laps) + 
              "\nČas: " + format_time(car.lap_time));

    if (car.lap >= car.max_laps) {
        draw_text(room_width/2 - 100, room_height/2 - 80, 
                  "FINISH HRÁČ\nCelkový čas: " + format_time(car.total_time));
        for (var i = 0; i < car.max_laps; i++) {
            draw_text(room_width/2 - 100, room_height/2 + i * 30 - 20, 
                      "Kolo " + string(i + 1) + ": " + format_time(car.lap_times[i]));
        }
    }
}

// === AI ===
var ai = instance_find(obj_ai_car, 0);
if (ai != noone) {
    draw_text(10, 80, "AI - Kolo: " + string(ai.lap + 1) + "/" + string(ai.max_laps) + 
              "\nČas: " + format_time(ai.lap_time));

    if (ai.lap >= ai.max_laps) {
        draw_text(room_width/2 + 100, room_height/2 - 80, 
                  "FINISH AI\nCelkový čas: " + format_time(ai.total_time));
        for (var i = 0; i < ai.max_laps; i++) {
            draw_text(room_width/2 + 100, room_height/2 + i * 30 - 20, 
                      "Kolo " + string(i + 1) + ": " + format_time(ai.lap_times[i]));
        }
    }
}
