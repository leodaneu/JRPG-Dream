if(room == room_battle) {
	obj_battle.enemy_counter_ = array_length(enemies_);
	obj_battle.parent_        = parent_;
		
	// Characters' positions		
	var _party_size = ds_map_size(obj_game.party_);
	var _initial_x  = 80;
	var _initial_y  = 80;// + 32 * (_party_size - 1);
	//var _initial_y  = 96 + 32 * (_party_size - 1);
	var _key        = ds_map_find_last(obj_game.party_);	
	//var _key        = ds_map_find_first(obj_game.party_);	
	
	for (var _i = 0; _i < _party_size; _i++) {
		var _y     = _initial_y + 48 * _i;
		//var _x     = _initial_x + 64 * _i;
		var _actor = obj_game.party_[? _key];
		var _pos   = [_initial_x, _y];
		//var _pos   = [_x, _initial_y];
		
		instance_create_layer(_initial_x, _y, "Actors", _actor.battle_unit_);
		//instance_create_layer(_x, _initial_y, "Actors", _actor.battle_unit_);
		_key = ds_map_find_previous(obj_game.party_, _key);
		//_key = ds_map_find_next(obj_game.party_, _key);
		ds_list_add(obj_battle.party_pos_, _pos);
	}
	
	// Spawning enemies	
	obj_battle.enemies_ = enemies_;
	var _enemies_size   = array_length(enemies_);
	var _initial_x      = 256;
	var _initial_y      = 64;// + 32 * (_enemies_size - 1);
	
	for(var _i  = 0; _i < _enemies_size; _i++) {
		var _x   = _initial_x - (32 * (_i % 2));
		var _y   = _initial_y + (32 * _i);
		var _pos = [_x, _y]; 
		
		ds_list_add(obj_battle.enemies_pos_, _pos);
		
		instance_create_layer(_pos[0], _pos[1], "Actors", obj_enemy_battle_unit);
		// instance_create_layer(obj_battle.x_positions_[| _i], obj_battle.y_positions_[| _i], "Instances_2", obj_enemy_battle_unit);
	}
	
	/*
	if (instance_exists(obj_start_position)) {
		var _instance_number = instance_number(obj_start_position);
		var _j = 0;
		var _key = ds_map_find_first(obj_game.party_);
		with(obj_start_position) {
			show_message(obj_game.party_[? _key]);
			var _actor = obj_game.party_[? _key];
			if (ds_map_exists(obj_game.party_, _key))
				instance_create_layer(x, y, "Actors", _actor.battle_unit_);
			_j++;
			_key = ds_map_find_next(obj_game.party_, _key);
		}	
	}*/

	// Spawning Enemies	
	/*
	for(enemy_index_ = 0; enemy_index_ < array_length(enemies_); enemy_index_++) {
		instance_create_layer(x, y, "Actors", obj_enemy_battle_unit);
		// instance_create_layer(obj_battle.x_positions_[| _i], obj_battle.y_positions_[| _i], "Instances_2", obj_enemy_battle_unit);
	}
	*/
	
	white_alpha_         = 1;
	orange_alpha_        = 1;
	target_white_alpha_  = 0;
	target_orange_alpha_ = 0;
}