cam_x_ = camera_get_view_x(view_camera[0]) + irandom_range(-screenshake_, screenshake_);
cam_y_ = camera_get_view_y(view_camera[0]) + irandom_range(-screenshake_, screenshake_);

event_user(state_);
camera_set_view_pos(view_camera[0], cam_x_, cam_y_);