/// @description  Initialize the menu ui
event_inherited();
height_ = 34;
green_white_ = make_color_rgb(193, 203, 150);
green_gray_  = make_color_rgb(139, 172, 15);

var _option_index           = 0;
options_                    = ds_list_create();
options_[| _option_index++] = create_option("Continue", menu_minigame_continue);
options_[| _option_index++] = create_option("Exit", menu_minigame_exit);

for (var _i = 0; _i < ds_list_size(options_); _i++)
    ds_list_mark_as_map(options_, _i);
	
if (instance_exists(obj_minigame_player)) {
    with(obj_minigame_player) {
		state_ = mini_player.wait;
	}
}
	
//if (instance_exists(obj_minigame_enemy)) {
//	with(obj_minigame_enemy) {
//		image_speed = 0;
//		image_index = 0;
//	}
//}	

