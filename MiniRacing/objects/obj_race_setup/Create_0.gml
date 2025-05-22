// Spawni hráčovo auto
var start_x1 = 350;
var start_y1 = 300;
var start_x2 = 330;
var start_y2 = 300;

instance_create_layer(start_x1, start_y1, "Instances", obj_car);

switch (global.rezim) {
    case "ai":
        instance_create_layer(start_x2, start_y2, "Instances", obj_ai_car);
        break;

    case "mp":
        instance_create_layer(start_x2, start_y2, "Instances", obj_car_2);
        break;
}
