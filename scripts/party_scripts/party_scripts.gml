function join_party(character, char_enum) {		
	ds_map_add(obj_game.party_, character, global.party[char_enum]);
	ds_list_add(obj_game.party_order_, character);
	
	var _stats_object = asset_get_index("obj_" + string_lower(character) + "_stats");
	instance_create_layer(0, 0, "Instances", _stats_object);
	
	return true;
}

function allow_join_party(character) {
	var _character_object = asset_get_index("obj_" + string_lower(character));
	
	with(_character_object) {
		add_to_destroyed_list(id);
		join_party_ = true;
	}
}

function clean_party_positions() {
	for (var _i = 0;_i < party_length_; _i++) {
		pos_x_[_i]         = x;
		pos_y_[_i]         = y;
		record_xscale_[_i] = image_xscale;
		record_sprite_[_i] = spr_player_run_down;
	}
}