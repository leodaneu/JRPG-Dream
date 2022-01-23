function create_cutscene(scene_info) {
	if (!instance_exists(obj_cutscene)) {
		var _instance = instance_create_layer(0, 0, "Instances", obj_cutscene);
	
		with(_instance) {
			scene_info_ = scene_info;
			event_perform(ev_other, ev_user0);
		}
	}
	
}

function cutscene_wait(seconds) {
	timer_++;

	if (timer_ >= seconds * room_speed) {
		timer_ = 0;
		cutscene_end_action();
	}
}

function cutscene_wait_press() {
	if (!instance_exists(obj_textbox))
		cutscene_end_action();
}

function cutscene_fade_transition() {
	instance_create_layer(0, 0, "Instances", obj_cutscene_fade);
	cutscene_end_action();
}

function cutscene_fade_screen(type) {
	instance_create_layer(0, 0, "Instances", obj_fade_screen);
	
	with(obj_fade_screen)
		leading_ = type;
		
	cutscene_end_action();
}

function cutscene_end_action() {
	scene_++;
	if (scene_ > array_length(scene_info_) - 1) {
		instance_destroy();
		exit;
	}

	event_perform(ev_other, ev_user0);
}

function cutscene_change_variable(obj, var_name, value) {
	with(obj)
		variable_instance_set(id, var_name, value);
	
	cutscene_end_action();
}

function cutscene_change_x_scale() {
	var _arg;
	var _i = 0;
	repeat(argument_count) {
		_arg[_i] = argument[_i];
		_i++;
	}

	if (argument_count > 1) 
		with(_arg[0]) 
			image_xscale = _arg[1];
	else 
		with(_arg[0]) 
			image_xscale *= -1;

	cutscene_end_action();
}

function cutscene_change_direction(object, dir_facing_x, dir_facing_y) {
	
	with (object) {
		get_direction_facing(point_direction(0, 0, dir_facing_x, dir_facing_y));
	}	
	cutscene_end_action();
}

function cutscene_clean_party_positions() {
	with (obj_player) 
		clean_party_positions();
	
	cutscene_end_action();
}

function cutscene_instance_create(x, y, layer_id, obj) {
	var _instance = instance_create_layer(x, y, layer_id, obj);
	cutscene_end_action();

	return _instance;
}

function cutscene_instance_destroy(obj_id) {
	with(obj_id) 
		instance_destroy();

	cutscene_end_action();
}

function cutscene_instance_destroy_nearest(x, y, obj) {
	var _instance_nearest = instance_nearest(x, y, obj);
	cutscene_instance_destroy(_instance_nearest);
}

function cutscene_move_character(obj, xx, yy, relative, speed) {
	if (x_destination_ == -1) {
		if (!relative) {
			x_destination_ = xx;
			y_destination_ = yy;
		} else {
			x_destination_ = obj.x + xx;
			y_destination_ = obj.y + yy;
		}
	}

	var _x_dest = x_destination_;
	var _y_dest = y_destination_;

	with(obj) {	
		//sprite_index = sprite_walk_;
		if (point_distance(x, y, _x_dest, _y_dest) >= speed) {
			var _direction = point_direction(x, y, _x_dest, _y_dest);
			var _dir_x     = lengthdir_x(speed, _direction);
			var _dir_y     = lengthdir_y(speed, _direction);
		
			if (_dir_x != 0)
				image_xscale = sign(_dir_x);

			x += _dir_x;
			y += _dir_y;	
		} else {
			//sprite_index = spr_player_idle_;
			x = _x_dest;
			y = _y_dest;			
			with(other) {
				x_destination_ = -1;
				y_destination_ = -1;
				cutscene_end_action();
			}
		}
	}
}

function cutscene_play_sound(sound_id, priority, loops) {
	audio_play_sound(sound_id, priority, loops);
	cutscene_end_action();
}

function cutscene_dialog(text_id) {
	create_textbox_cutscene(text_id);
	cutscene_end_action();
}

function cutscene_create_animation(sprite, x, y, speed, has_depth, sound_effect, priority, loop) {
	var _effect          = instance_create_layer(x, y, "Effects", obj_animation_effect);
	audio_play_sound(sound_effect, priority, loop);
	_effect.sprite_index = sprite;
	_effect.image_speed  = speed;

	if (has_depth)
		_effect.depth = -y;
	
	cutscene_end_action();
	//return _effect;
}

function cutscene_change_visibility(object, visibilty) {
	with (object) 
		can_draw_ = visibilty;//draw_enable_drawevent(visibilty);	
	
	cutscene_end_action();	
}

function cutscene_view_approach(target_x, target_y, width, height, amount, zoom_amount) {
	// This function is used to move the view. 
	// It also takes a new view width and height to allow for zooming.	
	x = lerp(x, target_x, amount);
	y = lerp(y, target_y, amount);

	var _cam = view_get_camera(0);
	var _vw  = camera_get_view_width(_cam);
	var _vh  = camera_get_view_height(_cam);

	// Get the change
	var _vwc = (_vw - width) * zoom_amount;
	var _vhc = (_vh - height) * zoom_amount;

	// Scale the view
	view_set_width(0, view_get_width(0) - _vwc);
	view_set_height(0, view_get_height(0) - _vhc);
	
	cutscene_end_action();
}