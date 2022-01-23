/// @description  Move the UI
if (!instance_exists(obj_target_cursor)) {
	if (character_index_ != noone and character_index_ != obj_enemy_battle_unit) {
		target_y_ = 160 + ((character_index_.state_ != battle_player.action) * 64);
	} else {
	    target_y_ = 224;	
	}
}

/*
if (instance_exists(o_playable_battle_unit)) {
    target_y_ = 160 + ((o_playable_battle_unit.state_ != battle_player.action) * 64);
} else {
    target_y_ = 224;	
}
*/

if (y != target_y_)
    y = lerp(y, target_y_, .1);

if (point_distance(x, y, x, 160) <= 16 and enabled_) {
	if (obj_input.right_pressed_ - obj_input.left_pressed_ != 0)
		audio_play_sound(aud_menu_move, 4, false);
		
	index_ += obj_input.right_pressed_ - obj_input.left_pressed_;
	
    //if (obj_input.right_pressed_) index_++;      
    //if (obj_input.left_pressed_) index_--;    
        
    index_ = clamp(index_, 0, 2);
		
	if (obj_input.action_) {
		audio_play_sound(aud_menu_select, 4, false);
		event_user(index_);
	}
}