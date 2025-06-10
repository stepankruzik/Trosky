// === FUNKCE PRO FORMÁT ČASU ===
function format_time(t) {
    var mins = floor(t / 60);
    var secs = floor(t % 60);
    var cents = floor((t - floor(t)) * 100);
    return string_format(mins, 2, 0) + ":" + string_format(secs, 2, 0) + ":" + string_format(cents, 2, 0);
}

// Proměnná, aby odměna byla přidána jen jednou
if (!variable_global_exists("reward_given")) global.reward_given = false;

if (global.game_mode == "solo") {
    // === Nastavení pozice vpravo dole ===
    var cx = display_get_gui_width() - 500;  // X vedle tachometru (tacháč máš cca na -200)
    var cy = display_get_gui_height() - 150;

    // === Data z auta ===
    var car = instance_find(obj_car, 0);
    if (car != noone) {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        draw_set_font(fnt_esc); // Nastav font dle projektu

        // Pokud ještě nedojel (je v závodě)
        if (car.lap < car.max_laps) {
            draw_text(cx, cy,
                "Kolo: " + string(car.lap + 1) + "/" + string(car.max_laps) +
                "\nČas: " + format_time(car.lap_time) +
                "\nPeněženka: $" + string(global.money));
        }
        else {
            // Finish zpráva na střed obrazovky
            var cx1 = display_get_gui_width() / 2;
            var cy1 = display_get_gui_height() / 2;

            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_yellow);
            draw_text(cx1, cy1, "FINISH HRÁČ\nCelkový čas: " + format_time(car.total_time) + "\n\nStiskni ENTER pro pokračování");
            draw_set_color(c_white);
			race_finished = true;

            // Přidání odměny jen jednou
            if (!global.reward_given && instance_exists(obj_wallet)) {
                with (obj_wallet) {
                    add_money(250);
                }
                global.reward_given = true;
            }
        }
    }
}



// === AI MODE ===
else if (global.game_mode == "ai") {
    var car = instance_find(obj_car, 0);
    var ai = instance_find(obj_ai_car, 0);
       var cx = display_get_gui_width() - 500;  // X vedle tachometru (tacháč máš cca na -200)
    var cy = display_get_gui_height() - 150;

    if (car != noone) {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        draw_set_font(fnt_esc);

        if (car.lap < car.max_laps) {
            draw_text(cx + 30, cy,
                "Hráč - Kolo: " + string(car.lap + 1) + "/" + string(car.max_laps) +
                "\nČas: " + format_time(car.lap_time) +
                "\nPeněženka: $" + string(global.money));
        }
        else {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_yellow);
            draw_set_font(fnt_esc);
            draw_text(cx, cy, "FINISH HRÁČ\nCelkový čas: " + format_time(car.total_time) + "\n\nStiskni ENTER pro pokračování");
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            for (var i = 0; i < car.max_laps; i++) {
                draw_text(cx - 150, cy + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(car.lap_times[i]));
            }

            race_finished = true;

            if (!global.reward_given && instance_exists(obj_wallet)) {
                with (obj_wallet) {
                    add_money(250);
                }
                global.reward_given = true;
            }
        }
    }

    if (ai != noone) {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        draw_set_font(fnt_esc);

        if (ai.lap < ai.max_laps) {
            draw_text(cx -150, cy,
                "AI - Kolo: " + string(ai.lap + 1) + "/" + string(ai.max_laps) +
                "\nČas: " + format_time(ai.lap_time));
        }
        else {
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_set_color(c_red);
            draw_set_font(fnt_esc);
            draw_text(cx, cy, "FINISH AI\nCelkový čas: " + format_time(ai.total_time));
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);

            for (var i = 0; i < ai.max_laps; i++) {
                draw_text(cx + 50, cy + 100 + i * 30, "Kolo " + string(i + 1) + ": " + format_time(ai.lap_times[i]));
            }
        }
    }
}



//==Multiplayer===
if (global.game_mode == "mp") {
    var screen_w = display_get_gui_width();
    var screen_h = display_get_gui_height();
    var half_w = screen_w / 2;

    // Samostatné horizontální offsety pro hráče
    var offset_x_left = 350;  // Hráč 2 (vlevo)
    var offset_x_right = 200; // Hráč 1 (vpravo)

    var offset_y = screen_h - 100;
    var line_spacing = 26;
    var reward_text_spacing = 30;

    var car1 = instance_find(obj_car, 0);     // Hráč 1 (vpravo)
    var car2 = instance_find(obj_car_2, 0);   // Hráč 2 (vlevo)

    draw_set_font(fnt_esc);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // === Hráč 2 (vlevo) ===
    if (car2 != noone) {
        if (car2.lap < car2.max_laps) {
            draw_text(offset_x_left, offset_y,
                "Hráč 2 - Kolo: " + string(car2.lap + 1) + "/" + string(car2.max_laps) +
                "\nČas: " + format_time(car2.lap_time));
        } else {
            draw_set_color(c_yellow);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text(half_w / 2, screen_h / 2, 
                "FINISH Hráč 2\nCelkový čas: " + format_time(car2.total_time) +
                "\n\nStiskni ENTER pro pokračování");

            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            for (var i = 0; i < car2.max_laps; i++) {
                draw_text(offset_x_left, offset_y + 100 + i * reward_text_spacing, 
                    "Kolo " + string(i + 1) + ": " + format_time(car2.lap_times[i]));
            }

            race_finished = true;
        }
    }

    // === Hráč 1 (vpravo) ===
    if (car1 != noone) {
        var x1 = half_w + offset_x_right;

        if (car1.lap < car1.max_laps) {
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_text(x1, offset_y,
                "Hráč 1 - Kolo: " + string(car1.lap + 1) + "/" + string(car1.max_laps) +
                "\nČas: " + format_time(car1.lap_time) +
                "\nPeněženka: $" + string(global.money));
        } else {
            draw_set_color(c_yellow);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text(half_w + half_w / 2, screen_h / 2, 
                "FINISH Hráč 1\nCelkový čas: " + format_time(car1.total_time) +
                "\n\nStiskni ENTER pro pokračování");

            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            for (var i = 0; i < car1.max_laps; i++) {
                draw_text(x1, offset_y + 100 + i * reward_text_spacing, 
                    "Kolo " + string(i + 1) + ": " + format_time(car1.lap_times[i]));
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
}
