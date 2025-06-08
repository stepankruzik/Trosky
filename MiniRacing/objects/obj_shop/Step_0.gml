// Ovládání šipek nahoru/dolů
if (keyboard_check_pressed(vk_up)) {
    selected_item--;
    if (selected_item < 0) selected_item = array_length(items) - 1;
}

if (keyboard_check_pressed(vk_down)) {
    selected_item++;
    if (selected_item >= array_length(items)) selected_item = 0;
}

// Koupit položku na Enter
if (keyboard_check_pressed(vk_enter)) {
    var price = prices[selected_item];

    if (global.money >= price) {
        global.money -= price;

        // Aplikace upgradu
        switch (selected_item) {
            case 0:
                global.upgrade_turn += 0.5;
                break;
            case 1:
                global.upgrade_acceleration += 0.01;
                break;
            case 2:
                global.upgrade_max_speed += 0.02;
                break;
        }

        // Uložení do INI
        ini_open("save.ini");
        ini_write_real("player", "money", global.money);
        ini_write_real("upgrades", "speed", global.upgrade_speed);
        ini_write_real("upgrades", "acceleration", global.upgrade_acceleration);
        ini_write_real("upgrades", "max_speed", global.upgrade_max_speed);
        ini_close();

        message = "Koupil jsi " + items[selected_item] + "!";
        message_time = message_duration;
    } else {
        message = "Nemáš dost peněz!";
        message_time = message_duration;
    }
}

// Časování zprávy
if (message_time > 0) {
    message_time--;
} else {
    message = "";
}
