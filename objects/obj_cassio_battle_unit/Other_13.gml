 /// @description Approach State
 image_speed  = 1.5;
 //sprite_index = sprite_[battle_player.idle];
 
if(abs(x - xstart) < 32) {
	if (alarm[1] <= 0)
		alarm[1] = global.one_second / 2;
	
	x                 = approach(x, xstart + 32, 2);
	y_approach_speed_ = -6 - abs(foe_.y - ystart) * .008;
	
} else if(alarm[1] <= 0) {
	sprite_index = sprite_[battle_player.approaching];
	
	if (image_index >= 6) {
		var _target_x = foe_.x;
		var _target_y = foe_.y;
	
		var _x_speed = point_distance(xstart + 32, ystart, _target_x, _target_y) / (.8 * global.one_second);
	
		//var _x_speed = (abs(_target_x - xstart) + 32) / (.8 * global.one_second);//min(28, 64/image_number);//(abs(_target_x - xstart) + 32) / (.8 * global.one_second);
		timer_++;

		// Calculate the image speed
		//var _frames = get_frames(_target_x, xstart, _target_y, y, _x_speed);
		//var _frames = BATTLE_SPACE / sprite_get_speed(sprite_index);
		//image_speed = get_image_speed(_frames, image_number);
		//image_speed = 1.5;
	
		// Set the view state
		//obj_battle_camera.target_[? "x"] = _target_x - 32 * image_xscale;
		//obj_battle_camera.state_         = battle_camera_mode.battle_view_focus;

		x = approach(x, _target_x, _x_speed);
	
		if (animation_hit_frame(8)) image_speed = 0;
	
		if (y_approach_speed_ < 6 + abs(_target_y - ystart) * .008)
			y_approach_speed_ += approach_gravity_;
		
		if (y_approach_speed_ > 0 and y + y_approach_speed_ > _target_y) {
			y_approach_speed_ = 0;
			y                 = _target_y;
		}
	
		y += y_approach_speed_;
		//y = approach(y, _target_y, _y_speed);

		if (x == _target_x and y == _target_y) {
			pre_approach_ = false;
		    state_        = battle_player.attack;
			image_index   = 0;
			image_speed   = 1;
		}
	}
}