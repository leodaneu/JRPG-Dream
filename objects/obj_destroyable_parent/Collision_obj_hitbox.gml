if (hurtbox_entity_can_be_hit_by(other)) {
	add_to_destroyed_list(id);
	instance_destroy();
	// instance_destroy(wall_);
	create_animation_effect(animation_effect_, x, y, 1, true);
}