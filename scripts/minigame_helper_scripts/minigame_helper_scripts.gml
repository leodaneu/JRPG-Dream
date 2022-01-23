function create_minigame_hitbox(sprite, x, y, angle, frames, targets, type, knockback) {	
	var _hitbox          = instance_create_layer(x, y, "Instances", obj_minigame_hitbox);
	_hitbox.sprite_index = sprite;
	_hitbox.image_angle  = angle;
	_hitbox.alarm[0]     = frames;
	_hitbox.targets_     = targets;
	_hitbox.type_        = type;
	_hitbox.knockback_   = knockback;
	
	return _hitbox;
}