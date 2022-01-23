var _on_ground   = tile_collide_at_points(tiles_, [bbox_left, bbox_bottom], [bbox_right - 1, bbox_bottom]);
var _jump        = keyboard_check(vk_space) * (alarm[0] > 0);
var _mask_height = other.bbox_bottom - other.bbox_top + 1;

if (velocity_[1] > 0 and !_on_ground) {
	var _height = y - other.y;
	
	if (abs(_height) > 3 *_mask_height / 4) {
		velocity_[1] = (-jump_speed_) - _jump * 1.5;
		velocity_[0] -= .4;
		
		var _hitbox = create_minigame_hitbox(spr_bomb_hitbox, x, y, direction_facing_ * 180, 4 , [obj_minigame_enemy], 1, 1);
	}
} else if (!invincible_ and abs(y - other.y) < 1) {
	var _hitbox = create_minigame_hitbox(spr_bomb_hitbox, x, y, 90, 4 , [obj_minigame_player], 1, 4);
}

//audio_play_sound(a_swipe, 8, false);