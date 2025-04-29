draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(-1);

// Najdeme auto v místnosti
var car = instance_find(obj_car, 0);

if (car != noone) {
    // Formát času
    function format_time(t) {
        var mins = floor(t / 60);
        var secs = floor(t % 60);
        var cents = (t - floor(t)) * 100;
        return string_format(mins, 2, 0) + ":" + string_format(secs, 2, 0) + ":" + string_format(cents, 2, 0);
    }

    // Aktuální info
    draw_text(10, 10, "Kolo: " + string(car.lap+1) + "/" + string(car.max_laps) + 
              "\nČas: " + format_time(car.lap_time));

    // Výsledky po dokončení
    if (car.lap >= car.max_laps) {
        draw_text(room_width/2 - 100, room_height/2 - 50, "FINISH!\nCelkový cas: " + format_time(car.total_time));
        for (var i = 0; i < car.max_laps; i++) {
            draw_text(room_width/2 - 100, room_height/2 + i*30 - 20, 
                      "\nKolo " + string(i+1) + ": " + format_time(car.lap_times[i]));
        }
    }
}