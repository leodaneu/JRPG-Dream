event_inherited();
initialize_movement_entity(.25, .5, obj_solid);

enum bat {
	wait,
	hit,
	move,
	chase
}

starting_state_ = bat.move;
state_          = starting_state_;
name_           = "Bat";

battle_units_     = [["Bat", enemies.bat]];
min_battle_units_ = 1;
max_battle_units_ = 2;

range_       = 64;
speed_       = .5;
image_index  = 0;
image_xscale = choose(-1, 1);
image_speed  = speed_;