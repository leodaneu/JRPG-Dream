if (keyboard_check_pressed(vk_escape)) {
	if (paused_) {
		paused_           = false;
		obj_player.state_ = obj_player.starting_state_;
		with(obj_enemy_parent) {
			image_speed = game_pause_speed_;
			state_      = starting_state_;
		}
		//instance_activate_all();
	}	
	else {
		paused_           = true;
		obj_player.state_ = player.wait;
		with(obj_enemy_parent) {
			game_pause_speed_ = image_speed;
			//speed_       = 0;
			state_ = enemy.hit;
		}
		//instance_deactivate_all(true);
	}
}