if (hurtbox_entity_can_be_hit_by(other)) {
	invincible_ = true;
	alarm[0]    = global.one_second * .5;
	//health_    -= other.damage_;
	state_      = minigame_enemy.hit;
	
	//var _knockback_direction = point_direction(other.x, other.y, x, y);
	//create_animation_effect(s_hit_effect, x, y - 8, 1, true);
	//create_animation_effect(spr_explosion_effect, x, y - 8, 1, true);
	//set_movement(_knockback_direction, other.knockback_);
	//audio_play_sound(a_hit, 7, false);
	instance_destroy();
}