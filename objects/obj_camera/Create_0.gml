event_inherited();
enum camera_mode {
	follow_object,
	follow_mouse_drag,
	follow_mouse_border,
	move_to_target,
	move_to_follow_object,
	view_cutscene
}

target_    = obj_player;
width_     = camera_get_view_width(view_camera[0]);
height_    = camera_get_view_height(view_camera[0]);
scale_     = view_wport[0] / width_;
boundless_ = false;
state_     = camera_mode.follow_object;
// state_   = camera_mode.move_to_follow_object;
// state_   = camera_mode.follow_mouse_border;