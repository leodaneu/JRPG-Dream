event_inherited();
enum battle_camera_mode {
	battle_view_idle,
	battle_view_intro,
	battle_view_focus
}

target_             = ds_map_create();
target_[? "base x"] = 480;
target_[? "base y"] = 90;
target_[? "x"]      = target_[? "base x"];
target_[? "y"]      = target_[? "base y"];

x = room_width / 1.25;
y = room_height / 2;

// target_    = o_player;
cam_x_start_ = camera_get_view_x(view_camera[0]);
cam_y_start_ = camera_get_view_y(view_camera[0]);
width_       = camera_get_view_width(view_camera[0]);
height_      = camera_get_view_height(view_camera[0]);
scale_       = view_wport[0] / width_;
boundless_   = false;
state_       = battle_camera_mode.battle_view_intro;