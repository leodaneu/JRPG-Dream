/// @description Attack State
// image_speed = animation_speed_[state_];

if (animation_hit_frame(1)) {	
	audio_play_sound(aud_attack, 5, false);
    set_hitflash(foe_, room_speed / 2);
	var _chance = chance(stats_object_.status_.critical_ / 100);
    deal_damage(id, foe_, _chance, 1);
	
	foe_x_ = foe_.x;
	foe_y_ = foe_.y;
    
	if (foe_.state_ != battle_player.defend)
		foe_.state_ = battle_player.hit;
		
	foe_.image_index = 0;
	
	put_to_wait(id, foe_.id);
	
	if (_chance) {
		//view_screenshake(2, room_speed * .5);	
		//obj_battle_camera.alarm[0] = global.one_second * .5;
	}	
	
    obj_battle_camera.state_ = battle_camera_mode.battle_view_idle;
}

if (animation_hit_frame(image_number - 1)) {
    state_      = battle_player.return_position;
	image_index = 0;
}