function get_direction_facing(input_direction) {
	direction_facing_ = round(input_direction / 90);
	
	if (direction_facing_ == 4)
		direction_facing_ = 0;
}

function approach(current, target, amount) {
	var _current = current;
	var _target  = target;
	var _amount  = amount;

	if (_current < _target) {
	    return min(_current + _amount, _target); 
	} else {
	    return max(_current - _amount, _target);
	}
}	

function animation_hit_frame(frame) {
	var _frame = frame;
	var _speed = global.one_second / sprite_get_speed(sprite_index);
	return (image_index >= _frame + 1 - image_speed / _speed) and (image_index < _frame + 1);
}

function get_frames(x1, x0, y1, y0, speed) {
	var _distance = point_distance(x0, y0, x1, y1);
	// var _dis = abs(_x1 - _x2);
	return (_distance / speed);
}

function round_n(value, increment) {
	return round(value / increment) * increment;
}

function set_sprite_facing(speed, direction) {
	var _x_speed = lengthdir_x(speed, direction);

	if (_x_speed != 0)
		image_xscale = sign(_x_speed);
}

function get_image_speed(frames, number) {
	return (number / frames);
}

function draw_self_flash(color, interval, flash_alarm) {
	if ((flash_alarm % interval) <= (interval / 2) and flash_alarm > 0) {
		gpu_set_fog(true, color, 0, 1);
		draw_self();
		gpu_set_fog(false, color, 0, 1);	
	}
}

function is_in_array(value, array) {
	for (var _i = 0; _i < array_length(array); _i++)
	    if (value == array[_i]) return true;

	return false;
}

function chance(percent) {
	return random(1) < percent;
}

function calculate_health(level, hp) {
	return round((hp * 3) + (3 * level));
}

function change_sprites(sprite, index, speed) {
	
	if (sprite_index != sprite) {
	    sprite_index = sprite;
	    image_index  = index;
	    image_speed  = speed;
	}
}

function singleton(object) {
	if (instance_exists(object)) {
		return object.id;
	} else {
		var _instance = instance_create_layer(0, 0, "Instances", object);
		_instance.persistent = true;
		return _instance;
	}
}