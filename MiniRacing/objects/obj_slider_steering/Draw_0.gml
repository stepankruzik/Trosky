// vykreslení pozadí lišty
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + 20, false);

// vykreslení slideru
draw_set_color(c_white);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * value), bar_y + 20, false);

// vykreslení knobu
draw_set_color(c_lime);
draw_circle(bar_x + (bar_width * value), bar_y + 10, 8, false);

// text
draw_set_color(c_white);
draw_text(bar_x, bar_y - 20, "Citlivost: " + string(floor(value * 100)) + "%");
