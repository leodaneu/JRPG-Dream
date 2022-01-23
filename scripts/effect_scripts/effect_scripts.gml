
function create_animation_effect(sprite, x, y, image_speed, has_depth) {
	var _effect          = instance_create_layer(x, y, "Effects", obj_animation_effect);
	_effect.sprite_index = sprite;
	_effect.image_speed  = image_speed;

	if (has_depth)
		_effect.depth = -y;
		
	return _effect;	
}