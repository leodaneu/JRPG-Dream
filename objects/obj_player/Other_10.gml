/// @description Move State
 image_speed          = 0;
 var _x_input         = obj_input.right_ - obj_input.left_;
 var _y_input         = obj_input.down_ - obj_input.up_;
 var _input_direction = point_direction(0, 0, _x_input, _y_input);
 var _action_input    = obj_input.action_;
 
if (_x_input == 0 and _y_input == 0) {
	image_index = 0;
	image_speed = 0;
	apply_friction_to_movement_entity();
} else {
	image_speed = 1;
	
	if (_x_input != 0) 
		image_xscale = _x_input;
	else
		image_xscale = 1;
		
	get_direction_facing(_input_direction);
	add_movement_max_speed(_input_direction, acceleration_, max_speed_);
}

if (obj_input.back_) {
    if (!instance_exists(obj_menu_ui)) {
		obj_game.paused_ = true;
        instance_create_layer(16, 16, "Instances", obj_menu_ui);	
		audio_play_sound(aud_menu_create, 2, false);
        exit;
    }
}	

interact(obj_input.action_);	
move_movement_entity(false);
move_party();