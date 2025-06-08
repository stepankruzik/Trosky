// Shop variables
shop_items = [
    {name: "Zvýšení rychlosti", level: global.car_speed_upgrade_level, base_price: 500}
];

selected_item = 0; // index vybraného předmětu

// Vybraná položka v menu

// Položky a ceny
items = ["Turbo", "Nitro", "Pneumatiky", "Brzdy"];
prices = [500, 1000, 750, 600];

// Stav zprávy (pro upozornění)
message = "";
message_time = 0;  // počítadlo jak dlouho zobrazit zprávu
message_duration = 120; // trvání zprávy v step eventech
