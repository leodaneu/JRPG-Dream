/// @description  Initialize the levelup
image_speed = .7;

// If there is a fade transition object remove it
if (instance_exists(obj_fade_transition)) {
    with (obj_fade_transition) 
		instance_destroy();
}
