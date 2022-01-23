 sprite_index = sprite_[state_, direction_facing_];
 event_user(state_);
 
 if (health_ <= 0 and !invincible_) {
	instance_destroy();
}