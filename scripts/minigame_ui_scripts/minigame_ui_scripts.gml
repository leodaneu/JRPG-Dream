function menu_minigame_exit() {
	room_goto(obj_minigame_manager.previous_room_);
	with(obj_minigame_player) 
		state_ = starting_state_;
	
	instance_destroy();
}

function menu_minigame_continue() {
	with(obj_minigame_player) 
		state_ = starting_state_;	
	
	instance_destroy();
}	