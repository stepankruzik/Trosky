for (var i = 0; i < array_length(options); i++) {
    var ox = start_x;
    var oy = start_y + i * spacing;
    if (point_in_rectangle(mouse_x, mouse_y, ox - 10, oy - option_height/2, ox - 10 + option_width, oy + option_height/2)) {
        if (mouse_check_button_pressed(mb_left)) {
            if (i == 0) global.rezim = "solo";
            else if (i == 1) global.rezim = "ai";
            else if (i == 2) global.rezim = "mp";

            // === Spuštění závodu podle režimu ===
            room_goto(Room1); // Přejdi do závodní místnosti
        }
    }
}
