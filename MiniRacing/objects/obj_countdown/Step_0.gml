// Step Event
countdown -= 1;

if (countdown == 0) {
    start_display = true;   // Aktivujeme zobrazení START

    with (obj_car) {
        can_move = true;
    }

    with (obj_ai_car) {
        can_move = true; // Aktivuj AI protivníka
    }
	
	with (obj_car_2) {
        can_move = true; // Aktivuj 2 hráče
    }
}

if (countdown < -room_speed) { // Necháme START zobrazit 1 sekundu
    instance_destroy();
}
