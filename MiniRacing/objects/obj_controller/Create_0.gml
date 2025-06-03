options = ["Solo (časovka)", "Závod proti AI", "Multiplayer"];
start_x = 720;
start_y = 460;
// ZVĚTŠENÍ MENU
option_width = 500;     // šířka volby
option_height = 100;     // výška boxu
spacing = 120;           // mezera mezi boxy

if (!variable_global_exists("rezim")) {
    global.game_mode = "mp"; // nebo jiný výchozí režim
}
