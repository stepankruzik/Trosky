// Step Event
countdown -= 1;

if (countdown == 0) {
    start_display = true;   // Aktivujeme zobrazení START
    with (obj_car) can_move = true;
}

if (countdown < -room_speed) { // Necháme START zobrazit 1 sekundu
    instance_destroy();
}