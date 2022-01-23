/// @description  Check for play

if (instance_exists(obj_playable_battle_unit) and instance_exists(obj_enemy_battle_unit)) {	
	var _can_procede = can_procede();
	
	if (_can_procede) {	
		with (obj_battle_unit) 
			state_ = battle_player.idle;		
		
		obj_battle.play_ = true;
	}	
}