// Draw Event
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(f_Countdown); 

var step = room_speed;

if (countdown > 3*step) {
    draw_text(room_width/2, room_height/2, "3");
} 
else if (countdown > 2*step) {
    draw_text(room_width/2, room_height/2, "2");
} 
else if (countdown > step) {
    draw_text(room_width/2, room_height/2, "1");
}
else if (start_display) {
    draw_text(room_width/2, room_height/2, "START!");
    
    // Přidejte efekt pro lepší viditelnost
    draw_set_color(c_red);
    for (var i = 0; i < 5; i++) {
        draw_text(room_width/2 + random_range(-3,3), 
                room_height/2 + random_range(-3,3), 
                "START!");
    }
    draw_set_color(c_white);
}