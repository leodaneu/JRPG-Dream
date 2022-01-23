/// @description Return Position State
image_speed  = animation_speed_[state_];
var _x_speed = abs(foe_.x - initial_x_) / (.2 * global.one_second);
var _y_speed = abs(foe_.y - initial_y_) / (.2 * global.one_second);

// Calculate the image speed
//var _frames = get_frames(_target_x, xstart + BATTLE_SPACE * image_xscale, _spd);
//var _frames = get_frames(x, initial_x_, y, initial_y_, _speed);
//image_speed = get_image_speed(_frames, image_number);

image_speed = 1.5;

x = approach(x, initial_x_, _x_speed);
y = approach(y, initial_y_, _y_speed);

// Move to target
if (x == initial_x_ and y == initial_y_) {
	if (obj_battle.enemy_counter_ == 0) {
		with (obj_playable_battle_unit) 
			state_   = battle_player.victory;
	} else {
		state_      = battle_player.wait;
		image_index = 0;
	}
}