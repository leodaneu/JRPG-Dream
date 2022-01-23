/// @description Move State
image_speed = .35;
set_sprite_facing(speed_, direction_);

if (alarm[1] <= 0) 
	apply_friction_to_movement_entity();
else 
	add_movement_max_speed(direction_, .05, .5);

move_movement_entity(true);

if (speed_ == 0) {
	alarm[1] = random_range(1, 3) * global.one_second;
	state_   = porcupine.idle;
}