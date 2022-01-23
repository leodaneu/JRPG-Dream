event_inherited();
initialize_movement_entity(.25, .5, obj_solid);

enum hornet {
	wait,
	hit,
	move,
	chase
}

starting_state_ = hornet.move;
state_          = starting_state_;

range_       = 40;
speed_       = 1;
image_index  = 0;
image_xscale = choose(-1, 1);
image_speed  = speed_;