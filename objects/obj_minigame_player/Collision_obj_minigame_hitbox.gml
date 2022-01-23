/// @description Hit Logic
if (hurtbox_entity_can_be_hit_by(other)) {
	invincible_ = true;
	alarm[1]    = global.one_second * .75;
	alarm[2]    = global.one_second * .45;
	
	health_--;
	//var _direction = point_direction(other.x, y, x, y);
	var _direction = point_direction(x, y, other.x, y);
	set_movement(_direction, other.knockback_);
	state_ = mini_player.hit;
	//audio_play_sound(a_hurt, 6, false);
	
	if (other.destroy_on_contact_) {
		instance_destroy(other);
	}
}

