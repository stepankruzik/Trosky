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
draw_set_font(fnt_esc); // Nastav font dle projektu

// === SOLO MODE ===
if (global.game_mode == "solo") {
    var car = instance_find(obj_car, 0);
    if (car != noone) {
        var cam = view_camera[0];
        var cx = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
        var cy = camera_get_view_y(cam) + camera_get_view_height(cam) - 110;
        var cx1 = cx;
        var cy1 = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;

        draw_text(cx - 100, cy,
            "Solo režim\nHráč - Kolo: " + string(car.lap + 1) + "/" + string(car.max_laps) +
            "\nČas: " + format_time(car.lap_time) +
			"\nPeněženka: $" + string(global.money));


        if (car.lap >= car.max_laps) {
            // Zobraz finish zprávu doprostřed
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_yellow);
            draw_set_font(fnt_esc);
            draw_text(cx1, cy1, "FINISH HRÁČ\nCelkový čas: " + format_time(car.total_time) + "\n\nStiskni ENTER pro pokračování");
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            // Detailní časy kol dole
            for (var i = 0; i < car.max_laps; i++) {
                draw_text(cx - 100, cy + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car.lap_times[i]));
            }

            // Nastavení flagu pro dokončení
            race_finished = true;

            // Přidání odměny jen jednou
            if (!reward_given && instance_exists(obj_wallet)) {
                with (obj_wallet) {
                    add_money(250);
                }
                reward_given = true;
            }
        }
    }
}

// === AI MODE ===
else if (global.game_mode == "ai") {
    var car = instance_find(obj_car, 0);
    var ai = instance_find(obj_ai_car, 0);
    var cam = view_camera[0];
    var cx = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
    var cy = camera_get_view_y(cam) + camera_get_view_height(cam) - 110;
    var cx1 = cx;
    var cy1 = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;
    var offset_x = 130;

    if (car != noone) {
        draw_text(cx - offset_x, cy,
            "Hráč - Kolo: " + string(car.lap + 1) + "/" + string(car.max_laps) +
            "\nČas: " + format_time(car.lap_time)+
			"\nPeněženka: $" + string(global.money));

        if (car.lap >= car.max_laps) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_yellow);
            draw_set_font(fnt_esc);
            draw_text(cx1, cy1, "FINISH HRÁČ\nCelkový čas: " + format_time(car.total_time) + "\n\nStiskni ENTER pro pokračování");
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            for (var i = 0; i < car.max_laps; i++) {
                draw_text(cx - offset_x, cy + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car.lap_times[i]));
            }

            race_finished = true;

            if (!reward_given && instance_exists(obj_wallet)) {
                with (obj_wallet) {
                    add_money(250);
                }
                reward_given = true;
            }
        }
    }

    if (ai != noone) {
        draw_text(cx + offset_x, cy,
            "AI - Kolo: " + string(ai.lap + 1) + "/" + string(ai.max_laps) +
            "\nČas: " + format_time(ai.lap_time));

        if (ai.lap >= ai.max_laps) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_red);
            draw_set_font(fnt_esc);
            draw_text(cx1, cy1, "FINISH AI\nCelkový čas: " + format_time(ai.total_time));
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            for (var i = 0; i < ai.max_laps; i++) {
                draw_text(cx + offset_x, cy + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(ai.lap_times[i]));
            }
        }
    }
}

// === MULTIPLAYER MODE (split screen) ===
else if (global.game_mode == "mp") {
    var car1 = instance_find(obj_car, 0);
    var car2 = instance_find(obj_car_2, 0);
    var offset_x = 130;

    // Hráč 1 - kamera 0
    if (car1 != noone) {
        var cam0 = view_camera[0];
        var cx0 = camera_get_view_x(cam0) + camera_get_view_width(cam0) / 2;
        var cy0 = camera_get_view_y(cam0) + camera_get_view_height(cam0) - 110;
        var cx1 = cx0;
        var cy1 = camera_get_view_y(cam0) + camera_get_view_height(cam0) / 2;

        draw_text(cx0 - offset_x, cy0,
            "Hráč 1 - Kolo: " + string(car1.lap + 1) + "/" + string(car1.max_laps) +
            "\nČas: " + format_time(car1.lap_time)+
			"\nPeněženka: $" + string(global.money));

        if (car1.lap >= car1.max_laps) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_yellow);
            draw_set_font(fnt_esc);
            draw_text(cx1, cy1, "FINISH Hráč 1\nCelkový čas: " + format_time(car1.total_time) + "\n\nStiskni ENTER pro pokračování");
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            for (var i = 0; i < car1.max_laps; i++) {
                draw_text(cx0 - offset_x, cy0 + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car1.lap_times[i]));
            }

            race_finished = true;

            if (!reward_given && instance_exists(obj_wallet)) {
                with (obj_wallet) {
                    add_money(250);
                }
                reward_given = true;
            }
        }
    }

    // Hráč 2 - kamera 1
    if (car2 != noone) {
        var cam1 = view_camera[1];
        var cx1 = camera_get_view_x(cam1) + camera_get_view_width(cam1) / 2;
        var cy1 = camera_get_view_y(cam1) + camera_get_view_height(cam1) - 110;
        var cx2 = cx1;
        var cy2 = camera_get_view_y(cam1) + camera_get_view_height(cam1) / 2;

        draw_text(cx1 - offset_x, cy1,
            "Hráč 2 - Kolo: " + string(car2.lap + 1) + "/" + string(car2.max_laps) +
            "\nČas: " + format_time(car2.lap_time));

        if (car2.lap >= car2.max_laps) {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_yellow);
            draw_set_font(fnt_esc);
            draw_text(cx2, cy2, "FINISH Hráč 2\nCelkový čas: " + format_time(car2.total_time) + "\n\nStiskni ENTER pro pokračování");
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            for (var i = 0; i < car2.max_laps; i++) {
                draw_text(cx1 - offset_x, cy1 + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car2.lap_times[i]));
            }

            race_finished = true;
        }
    }
} 