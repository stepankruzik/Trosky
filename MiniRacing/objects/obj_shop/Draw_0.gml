// Font a zarovnání
draw_set_font(fnt_shop);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var start_x = 500;
var start_y = 300;
var spacing = 36;
var item_width = 320;
var item_height = 32;
var padding = 30;

var help_text = "Enter pro nákup";
var help_text_height = 30;
var total_height = array_length(items) * spacing + help_text_height + 60;

// --- Pozadí ---
draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(start_x - padding, start_y - 50, start_x+ 50 + item_width + padding, start_y + total_height, false);
draw_set_alpha(1);

// --- Peněženka ---
draw_set_color(c_white);
draw_text(start_x - padding, start_y - 90, "Peněženka: " + string(global.money) + " Kč");

// --- Instrukce (uvnitř pozadí) ---
draw_set_color(c_gray);
draw_text(start_x, start_y - 30, help_text);

// --- Položky ---
for (var i = 0; i < array_length(items); i++) {
    var item_y = start_y + i * spacing;

    if (i == selected_item) {
        draw_set_color(c_dkgray);
        draw_rectangle(start_x - 10, item_y - 2, start_x + item_width, item_y + item_height - 2, false);
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }

    draw_text(start_x, item_y, items[i] + " - " + string(prices[i]) + " Kč");
}

// --- Zpráva ---
if (message != "") {
    draw_set_color(c_red);
    draw_text(start_x, start_y + array_length(items) * spacing + 10, message);
}
