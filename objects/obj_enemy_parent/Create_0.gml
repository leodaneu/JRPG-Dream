event_inherited();
initialize_movement_entity(1, .5, obj_solid);

image_speed = 0;
max_health_ = 4;
health_     = max_health_;

starting_state_ = noone;
state_          = starting_state_;

enum enemy {
	wait,
	hit
}