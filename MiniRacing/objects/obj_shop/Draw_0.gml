draw_set_font(fnt_esc);
draw_set_color(c_white);

draw_text(40, 80, "Obchod - Vyber položku pomocí šipek:");
draw_text(40, 110, "Peníze: $" + string(global.money));

var start_y = 140;
var spacing = 30;

for (var i = 0; i < array_length(items); i++) {
    y = start_y + i * spacing;


    if (i == selected_item) {
        draw_set_color(c_yellow);
        draw_rectangle(30, y - 5, 300, y + 20, false);
        draw_set_color(c_white);
    }

    draw_text(40, y, items[i] + " - Cena: $" + string(prices[i]));
}

// Zpráva (např. úspěch nebo chyba)
if (message != "") {
    draw_set_color(c_red);
    draw_text(room_width / 2, room_height - 50, message);
    draw_set_color(c_white);
}
