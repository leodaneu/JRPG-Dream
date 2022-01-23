/// @description  Update the stats
// Check for death
/*
if (draw_health_ <= 0) {
    if (instance_exists(obj_claudio_battle_unit)) {
        with (obj_claudio_battle_unit) instance_destroy();		
        room_goto(room_game_over);
    }
}
*/

// Check for levelup
if (status_.exp_ >= status_.max_exp_) {	
    // Create the level up object
    //if (!instance_exists(obj_levelup)) {
	//	var _x = room_width - view_get_width(0) / 2;
	//	var _y = view_get_width_y(0) + view_get_height(0) / 2;
		
	//	instance_create_layer(_x, _y, "Instances", obj_levelup);
    //}
    
    // Update the stats
    status_.level_++;  
    status_.exp_     = status_.exp_ - status_.max_exp_;
    status_.max_exp_ = status_.level_ * 10;
    status_.hp_      = calculate_health(status_.level_, status_.hp_);
    status_.max_hp_  = status_.hp_;
    
    // Learn a new ability
    //if (status_.level_ < array_length_1d(action_level_)) {
	/*
	var _new_ability_level = "_" + string(status_.level_);
	
	if (variable_struct_exists(class_.special_actions_, _new_ability_level)) {
		//var _new_action = class_.special_actions_;
        //var _new_action = action_level_[level_];
		var _new_action = variable_struct_get(class_.special_actions_, _new_ability_level);
        if (_new_action != noone) {
            ds_list_add(actions_, _new_action);
			ds_list_add(special_actions_, obj_game.actions_[? "Attack"]);
            var _message = create_message(0, 24, "You learned the#" + _new_action[? "name"]+" action.");
            _message.x   = display_get_gui_width() / 2 - _message.width_ / 2;
        }
    }
	*/
}
