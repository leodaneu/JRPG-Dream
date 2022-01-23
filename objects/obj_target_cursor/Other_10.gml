/// @description Target Enemy
target_x_ = obj_battle.enemies_pos_[| index_][0];
target_y_ = obj_battle.enemies_pos_[| index_][1] - 50;
	
//index_ += obj_input.right_pressed_ - obj_input.left_pressed_;
if (obj_input.down_pressed_ - obj_input.up_pressed_ != 0)
	audio_play_sound(aud_menu_move, 4, false);

index_ += obj_input.down_pressed_ - obj_input.up_pressed_;		
index_ = clamp(index_, 0, ds_list_size(obj_battle.enemies_pos_) - 1);

if (x != target_x_)
	x = lerp(x, target_x_, .7);
	
if (y != target_y_)
	y = lerp(y, target_y_, .7);
        
if (obj_input.back_) {
	audio_play_sound(aud_menu_select, 4, false);
	instance_destroy();
	obj_battle_ui.enabled_ = true;
}	

if (obj_input.action_) {
	audio_play_sound(aud_menu_select, 4, false);
	foe_ = instance_nearest(target_x_, target_y_ + 50, obj_battle_unit);
	
	with (obj_battle_ui.character_index_) {
		foe_            = other.foe_;
		state_          = other.action_.state_;
		approach_sound_ = false;
		image_index     = 0;
		
		//if (abs(x - xstart) < 32) {
		//	while(abs(x - xstart) < 32) {
		//		x        = approach(x, xstart + 32, 1);
		//		alarm[1] = global.one_second / 4;
		//	}
		//}
		
		//var _script = asset_get_index(other.action_.state_);
		//script_execute(_script);		
	}
	instance_destroy();	
}