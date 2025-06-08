// Step event – obj_shop

// Funkce pro přidání upgradu podle vybrané položky
function add_upgrade(item_index) {
    switch (item_index) {
        case 0: global.upgrade_turbo = true; break;
        case 1: global.upgrade_nitro = true; break;
        case 2: global.upgrade_tires = true; break;
        case 3: global.upgrade_brakes = true; break;
    }
}

// Inicializace zprávy a času (pokud ještě neexistují)

var message_duration = 90; // délka zobrazení zprávy v krocích (1.5 s při 60 fps)

// Ovládání výběru šipkami nahoru/dolů
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
        add_upgrade(selected_item);
        message = "Koupil jsi " + items[selected_item] + "!";
        message_time = message_duration;
    } else {
        message = "Nemáš dost peněz!";
        message_time = message_duration;
    }
}

// Aktualizace času zprávy
if (message_time > 0) {
    message_time--;
} else {
    message = "";
}
