/// @description Victory
//// Add droped items to inventory - TODO

with (instance_create_depth(10, 10, -9999, obj_textbox)) {
	audio_set_next_song(aud_battle_victory, false);
	textbox_x_  = camera_get_view_x(view_camera[0]);
	textbox_y_  = camera_get_view_y(view_camera[0]) + 8;
	textbox_height_ = 24;

	scr_text("YOU WON!");
	scr_text("You earned " + string(obj_battle.total_exp_) + " exp.");
			
	//with(obj_stats) {
	//	if(active_) {
	//		var _levelup_check = check_for_levelup(10, 60 + 60 /* _i*/);
								
	//		if (_levelup_check) {
	//			// play levelup sound - TODO
	//			//var _levelup_message = class_.name_ + " has reached level " + string(status_.level_) + ".#";
	//			with(other) {
	//				var _stats_string = "";
	//				_stats_string = "Level : "  + string(other.status_.level_) + "#";
	//				scr_text(_stats_string)
	//				_stats_string = "Name : "   + string(other.class_.name_)   + "#";
	//				scr_text(_stats_string)
	//				_stats_string = "Health : " + string(other.status_.hp_)    + "/" + string(other.status_.max_hp_)  + "#";
	//				scr_text(_stats_string)
	//				_stats_string = "Exp : "    + string(other.status_.exp_)   + "/" + string(other.status_.max_exp_) + "#";
	//				//scr_text(_levelup_message);
	//				scr_text(_stats_string)
	//			}	
	//		}					
	//	}
	//}
}
