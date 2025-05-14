if (keyboard_check_pressed(vk_escape)) {
    is_paused = true;
    global.return_room = room; // uložíme aktuální místnost, abychom se mohli vrátit
    room_goto(rm_esc);
}