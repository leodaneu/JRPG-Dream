/// @description Idle State
if (obj_minigame_input.right_ or obj_minigame_input.left_)
	state_ = mini_player.run;
	
y_speed_ += gravity_;
if (place_meeting(x, y + 1, collision_object_)  and obj_minigame_input.jump_) {
	y_speed_ = -2;
	//state_   = mini_player.jump;
	sprite_index = spr_minigame_jump;
}	

if (place_meeting(x, y + y_speed_, collision_object_)) {
	while (!place_meeting(x, y + sign(y_speed_), collision_object_)) 
		y += sign(y_speed_);
	y_speed_ = 0;
}
	
y += y_speed_;	
