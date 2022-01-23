event_inherited();

animation_effect_ = spr_bush_effect;

initialize_hurtbox_entity();

if (is_in_destroyed_list(id)) {
	instance_destroy();
}