// Detekce myši nad tlačítkem
hover = point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height);

// Kliknutí
if (hover && mouse_check_button_pressed(mb_left)) {
    if (text == "Pokračovat") room_goto(global.return_room);
    else if (text == "Konec")game_end();
    else if (text == "Menu") room_goto(rm_mode_select);
	else if (text == "Nastavení") room_goto(rm_menu_settings);
}
