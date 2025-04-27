// Step Event obj_car

// Ovládání dopředu/dozadu
if (keyboard_check(vk_up) || keyboard_check(ord("W")))
{
    speed += accel;
}
if (keyboard_check(vk_down) || keyboard_check(ord("S")))
{
    speed -= accel;
}

// Omezení maximální rychlosti
if (speed > max_speed)
{
    speed = max_speed;
}
if (speed < -max_speed/2)
{
    speed = -max_speed/2;
}

// Ovládání zatáčení
if (speed != 0)
{
    var turn_dir = (speed > 0) ? 1 : -1; // pokud couváme, obrátíme směr zatáčení
    if (keyboard_check(vk_left) || keyboard_check(ord("A")))
    {
        dir -= turn_speed * turn_dir;
    }
    if (keyboard_check(vk_right) || keyboard_check(ord("D")))
    {
        dir += turn_speed * turn_dir;
    }
}

// Pohyb auta
x += lengthdir_x(speed, dir);
y += lengthdir_y(speed, dir);

// Tření (friction)
if (speed > 0)
{
    speed = max(speed - friction, 0);
}
else if (speed < 0)
{
    speed = min(speed + friction, 0);
}
