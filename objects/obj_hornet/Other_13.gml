/// @description Chase State
if (!instance_exists(obj_player)) {
	state_ = hornet.move;
	exit;
}

if (distance_to_object(obj_player) > range_)
	state_ = hornet.move;
	
set_sprite_facing(speed_, direction_);
var _direction = point_direction(x, y, obj_player.x, obj_player.y);
add_movement_max_speed(_direction, .123, 1);
move_movement_entity(true);

var _player = instance_place(x, y, obj_player);

if (_player) {
	// Battle Mode
}
