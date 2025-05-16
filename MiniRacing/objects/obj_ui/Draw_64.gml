// === Nastavení vzhledu ===
draw_set_font(-1); // Nahraď vlastním fontem pokud chceš
draw_set_color(c_white);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);

// === Výpočty ===
var kmh = abs(obj_car.speed) * 20;
var rpm = abs(obj_car.speed) / obj_car.max_speed * 8000;
rpm = clamp(rpm, 0, 8000);

// === Pozice dolů doprostřed ===
var center_x = display_get_gui_width() / 2;
var y_pos = display_get_gui_height() - 20;

// === Vykreslení vedle sebe ===
draw_text_transformed(center_x - 150, y_pos, "Rychlost: " + string(round(kmh)) + " km/h", 2.8, 2.8, 0);
draw_text_transformed(center_x + 200, y_pos, "RPM: " + string(round(rpm)), 2.8, 2.8, 0);
