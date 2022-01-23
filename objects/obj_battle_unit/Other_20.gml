/// @description Death State
// image_speed = 0;
image_speed = animation_speed_[state_];
hitflash_   = true;

if (alarm[1] < 0) {
	if (image_alpha > 0) {
	    image_alpha -= .04;
	} else {
		var _value     = [initial_x_, initial_y_];
		var _index     = find_enemy_index(obj_battle.enemies_pos_, _value);
		var _map_value = obj_battle.enemies_[_index];
	
		ds_list_delete(obj_battle.enemies_pos_, _index);
		ds_map_delete(obj_game.enemy_battle_, _map_value);
		array_delete(obj_battle.enemies_, _index, _index)
	
		// ds_map_add(obj_game.enemy_battle_, other.battle_units_[0], global.enemies[enemies.bat]);
		obj_battle.enemy_counter_--;
		//ds_list_destroy(obj_battle.enemies_pos_);
	    instance_destroy();	
	}
}