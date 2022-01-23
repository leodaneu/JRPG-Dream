/// @description Battle Camera Intro State
target_[? "x"] = 480;
target_[? "y"] = 90;
        
x = round_n(x, 1 / scale_);
y = round_n(y, 1 / scale_);

x = clamp(x, width_ / 2, room_width - width_ / 2);
y = clamp(y, height_ / 2, room_height - height_ / 2);
        		
cam_x_ = x - width_ / 2;
cam_y_ = y - height_ / 2;
		
if (point_distance(x, y, target_[? "x"], target_[? "y"]) < 1) {
	x      = target_[? "x"];
	y      = target_[? "y"];	
	state_ = battle_camera_mode.battle_view_idle;
}
