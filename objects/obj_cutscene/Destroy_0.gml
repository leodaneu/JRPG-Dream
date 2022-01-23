/// @description Insert description here
// You can write your code in this editor
with(obj_follower_parent) {	
	if (ds_map_find_value(obj_game.party_, name_))
		state_ = follower.follow;
}