event_inherited();
enum mini_camera_mode {
	follow_object,
	view_cutscene
}

target_    = obj_minigame_player;
width_     = camera_get_view_width(view_camera[0]);
height_    = camera_get_view_height(view_camera[0]);
scale_     = view_wport[0] / width_;
boundless_ = false;
state_     = mini_camera_mode.follow_object;
// state_   = camera_mode.move_to_follow_object;
// state_   = camera_mode.follow_mouse_border;