/// @description Run State
 var _x_input         = obj_minigame_input.right_ - obj_minigame_input.left_;
 var _y_input         = obj_minigame_input.down_ - obj_minigame_input.up_;
 var _input_direction = point_direction(0, 0, _x_input, 0);
 var _action_input    = obj_minigame_input.action_;
 var _jump_input      = obj_minigame_input.jump_;
 
 if (_x_input == 0) {
	image_index = 0;
	image_speed = 0;
	//apply_friction_to_movement_entity();
} else {
	image_speed = 1;
	
	if (_x_input != 0) 
		image_xscale = _x_input;
	else
		image_xscale = 1;
		
	get_direction_minigame(_input_direction);	
	add_movement_max_speed(_input_direction, acceleration_, max_speed_);
}

if (obj_minigame_input.back_) {
    if (!instance_exists(obj_minigame_menu_ui)) {
        instance_create_layer(16, 16, "Instances", obj_minigame_menu_ui);	
        exit;
    }
}	

move_tilemap_collision();