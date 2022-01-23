// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_hitbox(sprite, x, y, angle, frames, targets, type, knockback) {	
	var _hitbox          = instance_create_layer(x, y, "Instances", obj_hitbox);
	_hitbox.sprite_index = sprite;
	_hitbox.image_angle  = angle;
	_hitbox.alarm[0]     = frames;
	_hitbox.targets_     = targets;
	_hitbox.type_        = type;
	_hitbox.knockback_   = knockback;
	
	return _hitbox;
}

function is_target(value, array) {
	var _array_length = array_length(array);
	
	for (var _i = 0; _i < _array_length; _i++) {
		if (value == array[_i] or object_get_parent(value) == array[_i])
			return true;
	}
	
	return false;
}