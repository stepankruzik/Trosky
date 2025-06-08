// Draw event – obj_shop

draw_set_font(fnt_shop);
draw_set_color(c_white);

// Explicitní zarovnání doleva nahoře
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var start_x = 500;
var start_y = 300;
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
draw_set_color(c_red);
draw_text(start_x, start_y - 40, "Pro výběr zboží použijte šipky, koupíte stisknutím ENTRU");

// Zobraz aktuální peníze
draw_set_color(c_red);
draw_text(start_x, start_y - 70, "Peněženka: " + string(global.money) + " Kč");

// Zobraz zprávu (pokud je)
if (message != "") {
    draw_set_color(c_red);
    draw_text(start_x, start_y + array_length(items) * spacing + 20, message);
}
