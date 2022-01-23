function move_mini_game(bounce) {
	var _bounce = bounce;

	// Apply friction when sliding on walls
	if (place_meeting(x + lengthdir_x(speed_, direction_), y + lengthdir_y(speed_, direction_), collision_object_) and !_bounce)
		speed_ = approach(speed_, 0, friction_ / 2);

	var _x_input         = obj_minigame_input.right_ - obj_minigame_input.left_;
	//var _y_input         = obj_minigame_input.down_ - obj_minigame_input.up_;
	var _x_speed = speed_ * _x_input + (obj_minigame_input.action_ * sign(_x_input) / 2);
	//var _y_speed = y_speed_;

	//if (speed_ <= 0) exit;
	y_speed_ += gravity_;
	if (place_meeting(x, y + 1, collision_object_) and obj_minigame_input.jump_) {
		y_speed_     = -3;
		//state_   = mini_player.jump; 
	}	
	
	if (place_meeting(x + _x_speed, y, collision_object_)) {
		while (!place_meeting(x + sign(_x_speed), y, collision_object_))
			x += sign(_x_speed);
		_x_speed = 0;	
	}	

	if (place_meeting(x, y + y_speed_, collision_object_)) {
		while (!place_meeting(x, y + sign(y_speed_), collision_object_)) 
			y += sign(y_speed_);
		y_speed_ = 0;
	}
	
	x += _x_speed;
	y += y_speed_;
	
	if (!place_meeting(x, y + 1, collision_object_)) {
		sprite_index = spr_minigame_jump;
	} else {
		if (_x_speed == 0)
			sprite_index = spr_minigame_idle;
		//else
		//	sprite_index = spr_minigame_run;
	}
	
	// Make sure to update speed and direction
	//speed_     = point_distance(0, 0, _x_speed, y_speed_);
	//direction_ = point_direction(0, 0, _x_speed, y_speed_);
}

function move_tilemap_collision() {
	var _x_input   = (obj_minigame_input.right_ - obj_minigame_input.left_) * acceleration_;
	var _vector2_x = 0;
	var _vector2_y = 1;

	velocity_[_vector2_x] = clamp(velocity_[_vector2_x] + _x_input, -max_velocity_[_vector2_x], max_velocity_[_vector2_x]);
	var _on_ground        = tile_collide_at_points(tiles_, [bbox_left, bbox_bottom], [bbox_right - 1, bbox_bottom]);
	
	
	if (_x_input == 0 and _on_ground) {
		velocity_[_vector2_x] = lerp(velocity_[_vector2_x], 0, .5);
		sprite_index         = spr_minigame_idle;
	}

	velocity_[_vector2_y] += gravity_;
	var _on_top_of_enemy  = place_meeting(x, y + abs(velocity_[_vector2_y]), obj_minigame_enemy);
	
	if (_on_top_of_enemy)
		alarm[0] = global.one_second / 10;
		
	move_and_contact_tiles(tiles_, 16, velocity_);
	_on_ground = tile_collide_at_points(tiles_, [bbox_left, bbox_bottom], [bbox_right - 1, bbox_bottom]);
	
	if (_on_ground) {
		if (obj_minigame_input.jump_) {
			velocity_[_vector2_y] = -jump_speed_ - obj_minigame_input.action_ ;
			sprite_index          = spr_minigame_jump;
		}
	} else {
		if (keyboard_check_released(vk_space) and velocity_[_vector2_y] <= -(jump_speed_ / 3))
			velocity_[_vector2_y] = -jump_speed_ / 3;			
		sprite_index = spr_minigame_jump;
	}
}

function get_direction_minigame(input_direction) {
	direction_facing_ = round(input_direction / 180);
	
	if (direction_facing_ == 4)
		direction_facing_ = 0;
}

function move_and_contact_tiles(tile_map_id, tile_size, velocity_array) {
	var vector2_x = 0;
	var vector2_y = 1;
	var _x_input  = obj_minigame_input.right_ - obj_minigame_input.left_;

	x += velocity_array[vector2_x] + obj_minigame_input.action_ * sign(_x_input) * .7;

	if (velocity_array[vector2_x] > 0) {
		var tile_right = tile_collide_at_points(tile_map_id, [bbox_right - 1, bbox_top], [bbox_right - 1, bbox_bottom - 1]);
		
		if (tile_right) {
			x = bbox_right & ~(tile_size - 1);
			x -= bbox_right - x;
			velocity_array[@ vector2_x] = 0;
		}
	} else {
		var tile_left = tile_collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_left, bbox_bottom - 1]);
		if (tile_left) {
			x = bbox_left & ~(tile_size - 1);
			x += tile_size + x - bbox_left;
			velocity_array[@ vector2_x] = 0;
		}
	}

	y += velocity_array[vector2_y];

	if (velocity_array[vector2_y] > 0) {
		var tile_bottom = tile_collide_at_points(tile_map_id, [bbox_left, bbox_bottom - 1], [bbox_right - 1, bbox_bottom - 1]);
		
		if (tile_bottom) {
			y = bbox_bottom & ~(tile_size - 1);
			y -= bbox_bottom - y;
			velocity_array[@ vector2_y] = 0;
		}
	} else {
		var tile_top = tile_collide_at_points(tile_map_id, [bbox_left, bbox_top], [bbox_right - 1, bbox_top]);
		
		if (tile_top) {
			y = bbox_top & ~(tile_size - 1);
			y += tile_size + y - bbox_top;
			velocity_array[@ vector2_y] = 0;
		}
	}
}

///@param tile_map_id
///@param point_arrays...
function tile_collide_at_points(tile_map_id) {
	var _found     = false;
	var _vector2_x = 0;
	var _vector2_y = 1;

	for (var _i = 1; _i < argument_count; _i++) {
		var _point = argument[_i];
		_found     = _found or tilemap_get_at_pixel(tile_map_id, _point[_vector2_x], _point[_vector2_y]);
	}

	return _found;
}