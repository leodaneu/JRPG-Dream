global.player_start_position = other.start_;
persistent                   = true;
room_goto(other.room_);	

with(obj_follower_parent) {
	if (ds_map_find_value(obj_game.party_, name_))
		persistent = true;
}