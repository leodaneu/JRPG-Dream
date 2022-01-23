/// @description Ranged Attack State
// You can write your code in this editor
image_speed       = animation_speed_[state_];
var _sprite_data  = obj_data.sprites_[? sprite_get_name(sprite_[battle_player.ranged_attack])];
var _xoffset      = _sprite_data[? "xoffset"];
var _yoffset      = _sprite_data[? "yoffset"];
var _effect_frame = _sprite_data[? "hit frame"];

// Hit
if (animation_hit_frame(_effect_frame)) {
    var _effect          = instance_create_layer(x + _xoffset, y + _yoffset, "Instances_2", effect_);
    _effect.image_xscale = image_xscale;
    _effect.direction    = point_direction(0, 0, image_xscale, 0);
    _effect.creator_     = id;
	
	if (is_in_party(id)) {
		// _effect.target_ = o_enemy_battle_unit;
		_effect.target_ = foe_;
	} else {
		// _effect.target_ = o_player_battle_unit;
		_effect.target_ = foe_;
	}
	
	put_to_wait(id, _effect.target_);
	
	/*
    if (object_index == o_player_battle_unit) {
        _effect.target_ = o_enemy_battle_unit;
    } else {
        _effect.target_ = o_player_battle_unit;
    }
	*/
}

// Return to the idle state
if (animation_hit_frame(image_number - 1)) {
    state_      = battle_player.wait;
	image_index = 0;
}