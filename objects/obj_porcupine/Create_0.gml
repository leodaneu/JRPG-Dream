event_inherited();
initialize_movement_entity(.5, .5, obj_solid);

enum porcupine {
	wait,
	hit,
	idle,
	move,
	attack
}

starting_state_ = porcupine.idle;
state_          = starting_state_;
speed_          = 0;

image_speed  = speed_;
image_index  = 0;
image_xscale = choose(1, -1);
alarm[1]     = random_range(0, 1) *  global.one_second;