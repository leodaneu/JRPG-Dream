/// @description Insert Move to Follow Object State
if (instance_exists(target_)) {
	cam_x_ = lerp(cam_x_, target_.x - width_ / 2, .1);
	cam_y_ = lerp(cam_y_, target_.y - height_ / 2, .1);
		
	if (point_distance(cam_x_, cam_y_, target_.x - width_ / 2, target_.y - height_ / 2)) {
		state_ = camera_mode.follow_object;
	}
}