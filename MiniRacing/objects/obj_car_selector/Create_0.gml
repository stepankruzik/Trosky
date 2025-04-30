car_sprites = [spr_car_red, spr_car_blue, spr_car_green, spr_car_yellow];
selected_index = 0;
global.selected_car_sprite = car_sprites[selected_index];

// Nejprve inicializujte car_x!
car_x = room_width / 2;
car_y = room_height / 2;
car_scale = 10;

// Až potom použijte car_x pro další proměnné
target_x = car_x;
current_x = car_x;
animation_speed = 20;