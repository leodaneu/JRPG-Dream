function initialize_movement_entity(friction, bounce_amount, collision_object) {
	speed_            = 0;
	direction_        = 0;
	friction_         = friction;
	bounce_amount_    = bounce_amount;
	collision_object_ = collision_object;
}

function add_movement_max_speed(direction, acceleration, max_speed) {
	var _direction    = direction;
	var _acceleration = acceleration;
	var _max_speed    = max_speed;
	
	var _x_speed = lengthdir_x(speed_, direction_);
	var _y_speed = lengthdir_y(speed_, direction_);
	
	var _x_acceleration = lengthdir_x(_acceleration, _direction);
	var _y_acceleration = lengthdir_y(_acceleration, _direction);

	_x_speed += _x_acceleration;
	_y_speed += _y_acceleration;

	speed_     = point_distance(0, 0, _x_speed, _y_speed);
	direction_ = point_direction(0, 0, _x_speed, _y_speed);
	speed_     = min(speed_, _max_speed);		
}

function apply_friction_to_movement_entity() {	
	speed_ = approach(speed_, 0, friction_);
}

 function move_movement_entity(bounce) {
	var _bounce = bounce;

	// Apply friction when sliding on walls
	if (place_meeting(x + lengthdir_x(speed_, direction_), y + lengthdir_y(speed_, direction_), collision_object_) and !_bounce)
		speed_ = approach(speed_, 0, friction_ / 2);

	var _x_speed = lengthdir_x(speed_, direction_);
	var _y_speed = lengthdir_y(speed_, direction_);

	if (speed_ <= 0) exit;

	if (place_meeting(x + _x_speed, y, collision_object_)) {
		while (!place_meeting(x + sign(_x_speed), y, collision_object_))
			x += sign(_x_speed);
	
		if (_bounce) 
			_x_speed = -_x_speed * bounce_amount_;
		else 
			_x_speed = 0;	
	}	

	if (place_meeting(x, y + _y_speed, collision_object_)) {
		while (!place_meeting(x, y + sign(_y_speed), collision_object_)) 
			y += sign(_y_speed);
		
		if (_bounce) 
			_y_speed = -_y_speed * bounce_amount_;
		else 
			_y_speed = 0;
	}
	
	x += _x_speed;
	y += _y_speed;
	
	// Make sure to update speed and direction
	speed_     = point_distance(0, 0, _x_speed, _y_speed);
	direction_ = point_direction(0, 0, _x_speed, _y_speed);
}

function set_movement(direction, speed) {
	direction_ = direction;
	speed_     = speed;
}

function move_party() {
	if (x != xprevious or y != yprevious) {
		for (var _i = party_length_ - 1; _i > 0; _i--) {
			pos_x_[_i]		   = pos_x_[_i - 1];
			pos_y_[_i]		   = pos_y_[_i - 1];
			record_xscale_[_i] = record_xscale_[_i - 1];
			record_sprite_[_i] = record_sprite_[_i - 1];
		}
		
		pos_x_[0]         = x;
		pos_y_[0]         = y;
		record_xscale_[0] = image_xscale;
		record_sprite_[0] = sprite_index;
	}
}