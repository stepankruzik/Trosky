for (var i = 0; i < array_length(options); i++) {
    var ox = start_x;
    var oy = start_y + i * spacing;

    if (point_in_rectangle(mouse_x, mouse_y, ox, oy, ox + option_width, oy + option_height)) {
        if (mouse_check_button_pressed(mb_left)) {
            if (i == 0) global.game_mode = "solo";
            else if (i == 1) global.game_mode = "ai";
            else if (i == 2) global.game_mode = "mp";

            room_goto(Room1); // přepnutí do závodní místnosti
        }
    }
}
