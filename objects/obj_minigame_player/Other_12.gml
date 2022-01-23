/// @description Hit State
image_index = 0;
move_movement_entity(true);
apply_friction_to_movement_entity();

if (alarm[2] <= 0) {
	state_ = starting_state_;
}