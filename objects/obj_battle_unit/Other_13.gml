 /// @description Approach State
//var _target_x = foe_.xstart;
//var _target_y = foe_.ystart;

var _target_x = foe_.x + 16 * sign(x - foe_.x);
var _target_y = foe_.y;
//var _speed    = 4.5;//min(11, 50 / image_index) * 1.5;//min(7, 30 / image_index);
var _x_speed = min(28, 64/image_number);//abs(_target_x - xstart) / (.6 * global.one_second);
var _y_speed = _x_speed//abs(_target_y - ystart) / (.6 * global.one_second);

//_x_speed += .3;

// Calculate the image speed
var _frames = get_frames(_target_x, xstart, _target_y, y, _x_speed);
image_speed = get_image_speed(_frames, image_number);
//var _frames = BATTLE_SPACE / sprite_get_speed(sprite_index);

//image_speed = 1.5;
// Set the view state
//obj_battle_camera.target_[? "x"] = _target_x - 32 * image_xscale;
//obj_battle_camera.state_         = battle_camera_mode.battle_view_focus;

// Move to target
x = approach(x, _target_x, _x_speed);
y = approach(y, _target_y, _y_speed);

if (x == _target_x and y == _target_y) {
    state_      = battle_player.attack;
	image_index = 0;
}