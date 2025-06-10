// Snížení timerů
if (boost_timer > 0) boost_timer--;
if (boost_cooldown_timer > 0) boost_cooldown_timer--;

// Aktivace boostu (např. mezerníkem – ale kontrola je jinde)

    base_speed = speed; // ulož aktuální rychlost jako základ
    speed = base_speed * 2;
    boost_active = true;
    boost_timer = boost_duration;
    boost_cooldown_timer = boost_cooldown;


// Konec boostu
if (boost_active && boost_timer <= 0) {
    speed = base_speed; // vrať původní rychlost
    boost_active = false;
}
