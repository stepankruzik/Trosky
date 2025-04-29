depth = -10;

// Pohybové proměnné
speed = 0;
direction = 270;
acceleration = 0.2;
max_speed = 5;
friction = 0.05;
turn_speed = 4;

// Checkpointy
current_checkpoint = 0;
total_checkpoints = 3; // Nastav skutečný počet
lap = 0;
max_laps = 3;

// Časovače
lap_times = array_create(max_laps, 0);
lap_time = 0;
total_time = 0;
can_move = false;