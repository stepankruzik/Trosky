if (keyboard_check_pressed(vk_escape)) {
    global.return_room = room; // Uložení aktuální místnosti
    room_goto(rm_esc);       // Skok do menu
}
