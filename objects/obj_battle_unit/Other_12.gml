/// @description Action State
image_speed                    = animation_speed_[state_];
obj_battle_ui.character_index_ = object_index;
obj_battle_camera.state_       = battle_camera_mode.battle_view_idle;

if (object_index == obj_enemy_battle_unit) {
	// if (stats_object_.status_ != noone and stats_object_.status_.hp_ == draw_health_) {
	if (status_ != noone and status_.hp_ == draw_health_) {
        
		// Make the enemy attack or defend based on the player's action meter
        var _action_index = 0;
       // if (obj_player_battle_unit.action_meter_ > 60 and chance(.8))
		//	_action_index = 1;
			
        if (chance(.1))		
			_action_index = 1;
        
        // Check for defend exception
        //var _action = status_.actions_[| _action_index];
		var _action = actions_[_action_index];
		
        if (_action == "Defend") {		
			state_ = battle_player.defend;
			//var _script = asset_get_index(_action[? "action"]);
            //script_execute(_script);
        } else if(_action == "Attack") {
			var _key = enemy_choose_target(obj_battle.party_members_);
			foe_     = obj_game.party_[? _key];
			foe_     = foe_.battle_unit_;
			state_   = battle_player.approaching;
			//var _script = asset_get_index(_action[? "action"]);		
			//script_execute(_script);
        } 
    }
}