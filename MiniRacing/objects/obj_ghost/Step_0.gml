if (ghost_index < array_length(ghost_path)) {
    var pos = ghost_path[ghost_index];
    x = pos[0];
    y = pos[1];
    image_angle = pos[2];
    ghost_index += 1;
}
