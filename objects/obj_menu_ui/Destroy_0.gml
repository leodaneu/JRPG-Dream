/// @description  Destroy the options
event_inherited();
ds_list_destroy(options_);
obj_game.paused_ = false;

if (instance_exists(obj_enemy_parent)) {
	with(obj_enemy_parent) {
		state_      = starting_state_;
		image_speed = speed_;
	}
}