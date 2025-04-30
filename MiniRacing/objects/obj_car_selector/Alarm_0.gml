selected_index = (selected_index + 1) % array_length(car_sprites);
global.selected_car_sprite = car_sprites[selected_index];
target_x = car_x; // Reset pozice
current_x = -300; // Začátek z levé stranys