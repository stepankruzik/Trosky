// Popisek nahoře
draw_set_color(c_white);
draw_text(bar_x, bar_y - 20, "Hlasitost:");

// Pozadí slideru
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Výplň podle hlasitosti
draw_set_color(c_lime);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * value), bar_y + bar_height, false);

// Knoflík
draw_set_color(c_white);
var knob_x = bar_x + (bar_width * value);
draw_rectangle(knob_x - 5, bar_y - 4, knob_x + 5, bar_y + bar_height + 4, false);

// Procenta
draw_set_color(c_white);
var percent = string(floor(value * 100)) + "%";
draw_text(bar_x + bar_width + 20, bar_y - 2, percent);
