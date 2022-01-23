function interact(input/*, item, action*/) {
	if (input) {
		var _target_x     = x + lengthdir_x(8, direction_facing_ * 90);
		var _target_y     = y + lengthdir_y(8, direction_facing_ * 90);
		var _interactable = instance_place(_target_x, _target_y, obj_interactable);
		var _follower     = instance_place(_target_x, _target_y, obj_follower_parent);
	    
		if (_interactable and _interactable.activatable_) {
			with (_interactable) 
				event_user(interactable.activate);
		} else if (_follower and _follower.state_ != follower.follow) {
			with(_follower)
				event_user(follower.talk);
		}
	}
}

function add_to_destroyed_list(id) {
	global.destroyed[array_length(global.destroyed)] = instance_key(id);
}

function is_in_destroyed_list(id) {
	return (array_find_index(instance_key(id), global.destroyed) != -1);
}

function array_find_index(value, array) {
	var _array_length = array_length(array); 

	for (var _i = 0; _i < _array_length; _i++) 
		if (value == array[_i]) 
			return _i;	

	return -1;
}

function instance_key(id) {
	var _room = room_get_name(room);
	var _name = object_get_name(id.object_index);
	var _x    = string(id.xstart);
	var _y    = string(id.ystart);
	var _key  = _room + _name + _x + _y;

	return _key;
}

function set_player_found_item(item_sprite, item) {

	if (!instance_exists(obj_player)) 
		exit;

	obj_player.state_             = player.found_item;
	obj_player.found_item_sprite_ = item_sprite;
	//obj_player.invincible_        = true;
	obj_player.alarm[2]           = global.one_second * 1.2;
	audio_play_sound(aud_key_item, 6, false);
	create_message_at_view_center("You got the " + item[? "name"] + "!");
}

function go_to_minigame() {
	if (!instance_exists(obj_minigame_transition)) {	
		instance_create_layer(0, 0, "Instances", obj_minigame_transition); 
		
		with(obj_minigame_transition) 
			parent_ = other; 				
			    
		audio_set_next_song(aud_minigame_level_1, true);
	}
}

function script_execute_alt(s, array) {
	var _a      = array;
	var _length = array_length(array);
	var _val;

	switch(_length) {
		case 0:  _val = script_execute(s); break;
		case 1:  _val = script_execute(s, _a[0]); break;
		case 2:  _val = script_execute(s, _a[0], _a[1]); break;
		case 3:  _val = script_execute(s, _a[0], _a[1], _a[2]); break;
		case 4:  _val = script_execute(s, _a[0], _a[1], _a[2], _a[3]); break;
		case 5:  _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4]); break;
		case 6:  _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5]); break;
		case 7:  _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6]); break;
		case 8:  _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7]); break;
		case 9:  _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8]); break;
		case 10: _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9]); break;
		case 11: _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10]); break;
		case 12: _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11]); break;
		case 13: _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12]); break;
		case 14: _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13]); break;
		case 15: _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13], _a[14]); break;
		case 16: _val = script_execute(s, _a[0], _a[1], _a[2], _a[3], _a[4], _a[5], _a[6], _a[7], _a[8], _a[9], _a[10], _a[11], _a[12], _a[13], _a[14], _a[15]); break;	
	}
	
	return _val;
}