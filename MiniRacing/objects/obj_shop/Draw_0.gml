// Draw event – obj_shop

draw_set_font(fnt_esc);
draw_set_color(c_white);

var start_x = 100;
var start_y = 100;
var spacing = 30;

for (var i = 0; i < array_length(items); i++) {
    y = start_y + i * spacing;
    
    if (i == selected_item) {
        draw_set_color(c_yellow);
        draw_text(start_x - 20, y, "X");
    } else {
        draw_set_color(c_white);
    }
    
    draw_text(start_x, y, items[i] + " - " + string(prices[i]) + " Kč");
}

// Zobraz aktuální peníze
draw_set_color(c_lime);
draw_text(start_x, start_y - 40, "Peněženka: " + string(global.money) + " Kč");

// Zobraz zprávu (pokud je)
if (message != "") {
    draw_set_color(c_red);
    draw_text(start_x, start_y + array_length(items) * spacing + 20, message);
}
