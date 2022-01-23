/// @description Victory State    
ds_list_destroy(obj_battle.enemies_pos_);
ds_list_destroy(obj_battle.party_pos_);

image_speed = 1;

with(obj_battle.parent_)
	instance_destroy();
	
if (obj_battle.has_won_) {
	obj_battle.has_won_ = false;
	
	with(obj_battle)
		event_perform(ev_other, ev_user0);
		
	//if (obj_input.action_ or obj_input.back_ or alarm[2] <= 0) {
		//_i = 0;	

		//with(obj_stats) {
		//	if(active_) {
		//		var _stats_string = "";
		//		_stats_string += "Level : "  + string(status_.level_) + "#";
		//		_stats_string += "Name : "   + string(class_.name_)   + "#";
		//		_stats_string += "Health : " + string(status_.hp_)    + "/" + string(status_.max_hp_)  + "#";
		//		_stats_string += "Exp : "    + string(status_.exp_)   + "/" + string(status_.max_exp_) + "#";
				
		//		with (instance_create_depth(10, 50 + 60 * _i, -9999, obj_textbox)) 
		//			scr_text(_stats_string);
						
		//		_i++;
		//	}
		//}
		
		//with(obj_message_ui) {
		//	alarm[0] = room_speed * 2;
		//}
	
		//switch (info_counter_) {
		//case 0:						
		//	// check for levelup
		//	if (info_lock_) {
		//		_i         = 0;
		//		info_lock_ = false;
		//		with (obj_stats) {
		//			// var _levelup_check = check_for_levelup(180, 40 + 60 * _i);
		//			var _levelup_check = check_for_levelup(10, 60 + 60 * _i);
		//			//var _name          = stats_[? "name"];			
		//			if (_levelup_check) {
		//				// play levelup sound - TODO
		//				other.info_message_ = create_message(10, 40 + 60 * _i, class_.name_ + " has reached level " + string(status_.level_) + ".#");
		//			}
		//			_i++;
		//		}
		//	}
			
		
		//	with(obj_message_ui) {
		//		alarm[0] = room_speed * 5;
		//	}
		
		
		//	if (alarm[2] <= 0) {
		//		alarm[2] = room_speed * 5;
		//		info_counter_++;
		//		info_lock_ = true;
		//	}			
		
		//case 1:			
		//	// check for new skills
		//	//with (o_message_ui) {
		//	//	instance_destroy(); // destroy previous messages (levelup)
		//	//}
		//	if (info_lock_) {
		//		_i         = 0;
		//		info_lock_ = false;
		//		with(obj_stats) {
		//			if(active_) {
		//				// play new skill sound - TODO
		//				var _stats_string = "";
		//				_stats_string += "Level : "  + string(status_.level_) + "#";
		//				_stats_string += "Name : "   + string(class_.name_)   + "#";
		//				_stats_string += "Health : " + string(status_.hp_)    + "/" + string(status_.max_hp_)  + "#";
		//				_stats_string += "Exp : "    + string(status_.exp_)   + "/" + string(status_.max_exp_) + "#";							
				
		//				with (instance_create_depth(10, 50 + 60 * _i, -9999, obj_textbox)) {
		//					scr_text(_stats_string);
		//				}
		//				//var _character    = create_message(10, 50 + 60 * _i, _stats_string);
		//				//_character.width_ = 160;
		//				_i++;
		//			}
		//		}
		//		if (alarm[2] <= 0) {
		//			alarm[2] = room_speed * 2;
		//			info_counter_++;
		//			info_lock_ = true;
		//		}
		//	}			
		
		//case 2:
		//	// check for items
		//	alarm[1] = room_speed * 2;
		//}		
	//}
}

if (!instance_exists(obj_textbox) and obj_input.action_ or obj_input.back_/* or alarm[1] <= 0*/) {
	with (obj_message_ui) {
		instance_destroy();
	}
		
	var _transition        = instance_create_layer(0, 0, "Instances", obj_fade_transition);
	_transition.next_room_ = obj_game.last_room_;
	_transition.total_exp_ = obj_battle.total_exp_;
}