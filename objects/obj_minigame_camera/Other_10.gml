/// @description Follow Object State
if (instance_exists(target_)) {
	x =	lerp(x, target_.x, .1);
	y = lerp(y, target_.y - 8, .1);

	x = round_n(x, 1 / scale_);
	y = round_n(y, 1 / scale_ );

	x = clamp(x, width_ / 2, room_width - width_ / 2);
	y = clamp(y, height_ / 2, room_height - height_ / 2);
		
	cam_x_ = x - width_ / 2;
	cam_y_ = y - height_ / 2;		
}