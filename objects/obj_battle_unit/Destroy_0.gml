//obj_battle.total_exp_ += min(stats_object_.status_.level_ / 2, 1) * stats_object_.status_.exp_;
obj_battle.total_exp_ += class_.drop_exp_;

if (obj_battle.enemy_counter_ == 0) {
	if (object_index == obj_enemy_battle_unit) {					
		var _stats_number = instance_number(obj_stats);
		
		with (obj_playable_battle_unit) {
			alarm[2] = global.one_second * 2;
			//state_   = battle_player.victory;
		}
		
		obj_battle.has_won_ = true;
			
		with(obj_stats)			
			status_.exp_ += round(obj_battle.total_exp_ / _stats_number);	
			
		////// Add droped items to inventory - TODO	
		//with (instance_create_depth(10, 10, -9999, obj_textbox)) {
		//	textbox_x_      = 10;
		//	textbox_y_      = 10;
		//	textbox_height_ = 24;
			
		//	scr_text("YOU WON!");
		//	scr_text("You earned " + string(obj_battle.total_exp_) + " exp.#");
			
		//	with(obj_stats) {
		//		if(active_) {
		//			var _levelup_check = check_for_levelup(10, 60 + 60 /* _i*/);
								
		//			if (_levelup_check) {
		//				// play levelup sound - TODO
		//				//var _levelup_message = class_.name_ + " has reached level " + string(status_.level_) + ".#";
		//				with(other) {
		//					var _stats_string = "";
		//					_stats_string = "Level : "  + string(other.status_.level_) + "#";
		//					scr_text(_stats_string)
		//					_stats_string = "Name : "   + string(other.class_.name_)   + "#";
		//					scr_text(_stats_string)
		//					_stats_string = "Health : " + string(other.status_.hp_)    + "/" + string(other.status_.max_hp_)  + "#";
		//					scr_text(_stats_string)
		//					_stats_string = "Exp : "    + string(other.status_.exp_)   + "/" + string(other.status_.max_exp_) + "#";
		//					//scr_text(_levelup_message);
		//					scr_text(_stats_string)
		//				}	
		//			}
					
		//		}
		//	}
		//}		
	} else {
		ds_map_destroy(stats_);
		ds_list_destroy(actions_);
	}			
}

obj_battle.play_         = false;
obj_battle_camera.state_ = battle_camera_mode.battle_view_idle;	