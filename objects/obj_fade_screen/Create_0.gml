enum leading {
	in,
	out	
}

width_   = camera_get_view_width(view_camera[0]);
height_  = camera_get_view_height(view_camera[0]);
limiter_ = height_ / 8;
percent_ = 0;
leading_ = leading.out;
transition_spd_ = .05;