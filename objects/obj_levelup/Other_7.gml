/// @description  End the animation
if (image_speed > 0) {
    image_index = image_number - 1;
    image_speed = 0;
    alarm[0]    = room_speed * 2;
	instance_create_layer(x - 48, y, "Instances", obj_levelup_arrow);
	instance_create_layer(x + 48, y, "Instances", obj_levelup_arrow);      
}
