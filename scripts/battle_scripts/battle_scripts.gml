 function encounter() {
	obj_player.state_ = player.battle_encounter;
	
	// TODO
	/*with(obj_follower_parent)
		 state_ = follower.battle;*/
	
	if (!instance_exists(obj_battle_transition)) {	
		instance_create_layer(0, 0, "Instances", obj_battle_transition); 
		enemies_num_       = choose(min_battle_units_, max_battle_units_);
		battle_units_size_ = array_length(battle_units_);
				
		with(obj_battle_transition) {
			ds_map_add(obj_game.enemy_battle_, other.battle_units_[0][0] + "_0", global.enemies[other.battle_units_[0][1]]);
			parent_     = other; 
			enemies_[0] = other.battle_units_[0][0] + "_0";		
			var _i      = 1;
			
			repeat(other.enemies_num_) {
				var _index = irandom(other.battle_units_size_ - 1);
				var _key   = other.battle_units_[_index][0] + "_" + string(_i);
				
				ds_map_add(obj_game.enemy_battle_, _key, global.enemies[other.battle_units_[_index][1]]);
				// enemies_[_i] = other.battle_units_[_index][0];
				enemies_[_i] = _key;
				_i++;
			}	
		}
		
	    // Update the song
		audio_set_next_song(aud_battle_music, true);
		// audio_play_sound(a_battle_music, 2, true);
	    // o_audio_player.fade_      = false;
	    // o_audio_player.next_song_ = a_battle_music;
	}
} 

function init_battle_unit(name, enemy, idle_speed, attack_speed, hit_speed, ranged_speed) {
	if (enemy) {
		// var _index    = 0;
		var _index    = obj_battle_transition.enemy_index_;
		var _key      = obj_battle_transition.enemies_[_index];
		stats_object_ = id;
		obj_battle_transition.enemy_index_++;
				
		class_         = obj_game.enemy_battle_[? _key];
		class_         = class_.create();
		status_        = class_.status_;
		actions_       = class_.actions_;
		status_effect_ = class_.status_effect_;
		draw_health_   = status_.hp_;
		
		/*
	    with (stats_object_) {
	        get_stats_from_class(name);
	        draw_health_ = status_.hp;            
	        actions_     = create_action_list();
			
			
			//////////////////////////////////////
			stats_ = ds_map_create();
			stats_ = json_decode(json_encode(o_data.classes_[? _class_string]));

			stats_[? "maxhealth"] = calculate_health(level_, stats_[? "health"]);
			stats_[? "health"]    = stats_[? "maxhealth"];

			// if (object_index == o_player_stats) {
			if (object_get_parent(object_index) == obj_stats) {
			    stats_[? "maxexperience"] = level_ * 10;
			}
	    }
		*/	
	}

	/*
	with (stats_object_) {
	    // Create the status effect array
	    status_effect_[status.defend] = false;
	    status_effect_[status.slow]   = false;
	    status_effect_[status.burnt]  = false;
	}*/
	
	var _name = string_lower(stats_object_.class_.name_);

	sprite_[battle_player.idle]            = asset_get_index("spr_battle_" + _name + "_idle");
	sprite_[battle_player.wait]            = asset_get_index("spr_battle_" + _name + "_idle");
	sprite_[battle_player.action]          = asset_get_index("spr_battle_" + _name + "_idle");
	sprite_[battle_player.approaching]     = asset_get_index("spr_battle_" + _name + "_approach");
	sprite_[battle_player.attack]          = asset_get_index("spr_battle_" + _name + "_attack");
	sprite_[battle_player.return_position] = asset_get_index("spr_battle_" + _name + "_return");
	sprite_[battle_player.use_item]        = asset_get_index("spr_battle_" + _name + "_use_item");
	sprite_[battle_player.hit]             = asset_get_index("spr_battle_" + _name + "_hit");
	sprite_[battle_player.defend]          = asset_get_index("spr_battle_" + _name + "_defend");
	sprite_[battle_player.death]           = asset_get_index("spr_battle_" + _name + "_hit");
	sprite_[battle_player.ranged_attack]   = asset_get_index("spr_battle_" + _name + "_ranged");
	sprite_[battle_player.victory]         = asset_get_index("spr_battle_" + _name + "_victory");

	animation_speed_[battle_player.idle]            = idle_speed;
	animation_speed_[battle_player.wait]            = idle_speed;
	animation_speed_[battle_player.action]          = idle_speed;
	animation_speed_[battle_player.approaching]     = 0;
	animation_speed_[battle_player.attack]          = attack_speed;
	animation_speed_[battle_player.return_position] = 0;
	animation_speed_[battle_player.hit]             = hit_speed;
	animation_speed_[battle_player.use_item]        = attack_speed / 2;
	animation_speed_[battle_player.defend]          = idle_speed;
	animation_speed_[battle_player.death]           = hit_speed;
	animation_speed_[battle_player.victory]         = .8;
	animation_speed_[battle_player.ranged_attack]   = ranged_speed;

	image_speed  = animation_speed_[battle_player.idle];
	sprite_index = sprite_[battle_player.idle];
}

function can_procede() {
	with (obj_playable_battle_unit) 
		if (state_ != battle_player.wait) 				
			return false;

	with(obj_enemy_battle_unit) 
		if (state_ != battle_player.wait) 	
			return false;

	return true;
}

function choose_target() {	
	instance_create_layer(obj_battle.enemies_pos_[| 0][0], obj_battle.enemies_pos_[| 0][1], "Instances", obj_target_cursor);
	obj_target_cursor.target_  = target.enemy;
	obj_target_cursor.creator_ = id;	
}

function choose_ally() {
	instance_create_layer(obj_battle.party_pos_[| 0][0], obj_battle.party_pos_[| 0][1] - 20, "Instances", obj_target_cursor);
	obj_target_cursor.target_     = target.ally;
	obj_target_cursor.creator_    = id;
	obj_target_cursor.item_index_ = obj_item_list_ui.index_;
}

function enemy_choose_target(party_members) {
	var _size   = array_length(party_members);
	var _random = irandom_range(0, _size - 1);
	
	return party_members[_random];
}

function deal_damage(unit1, unit2, critical, modifier) {
	var _attacker       = unit1.stats_object_;
	var _defender       = unit2.stats_object_;
	var _attack         = _attacker.status_.strength_;
	var _defense        = _defender.status_.defense_;
	var _defending_unit = unit2;

	if (instance_exists(_defender) and instance_exists(_attacker)) {
	    var _damage       = (_attack + (_attacker.status_.level_ * 3) + (1 - _defense * .05)) * .5;
	    var _total_damage = (_damage + (critical * _damage * (_attacker.status_.critical_ / 100))) / (_defender.status_effect_.defend_ + 1.5);
	    
		_total_damage *= modifier;	 
	    _defender.status_.hp_ -= _total_damage;
	    
		var _hit       = instance_create_layer(_defending_unit.x, _defending_unit.y - 32, "Instances", obj_hit);
	    _hit.amount_   = round(_total_damage);
		unit2.damage_  = round(_total_damage);
	    _hit.critical_ = critical;	
	}
}

function find_enemy_index(enemies_pos, position) {
	var _list_length = ds_list_size(enemies_pos);
	
	for (var _i = 0; _i < _list_length; _i++) 
		if (array_equals(enemies_pos[| _i], position)) 
			return _i;
	
	return -1;
}

function set_hitflash(target, duration) {
	with (target) {
	    hitflash_ = true;
	    alarm[0]  = duration;
	}
}

function put_to_wait(unit1 , unit2) {
	with (obj_battle_unit) {
		if (id != unit1 and id != unit2) 
			state_ = battle_player.wait;	
	}
}

function draw_bar(x, y, sprite, health, max_health) {
	var _index = 0;
	if (health >= 0) {
	    _index = (health / max_health) * (sprite_get_number(sprite) - 1);
	}

	draw_sprite(sprite, _index, x, y);
}

function check_for_levelup(argument0, argument1) {

	var _a = argument0;
	var _b = argument1;

	if (status_.exp_ >= status_.max_exp_) {				
		//if (!instance_exists(obj_levelup)) {
		//	var _x = room_width - view_get_width(0) / 2;
		//	var  _y = view_get_width_y(0) + view_get_height(0) / 2;
		//	instance_create_layer(_x, _y, "Instances", obj_levelup);
		//	//instance_create_layer(_a, _b, "Instances", obj_levelup);
		//}
    
		status_.level_++;
		status_.exp_     = status_.exp_ - status_.max_exp_;
		status_.max_exp_ = status_.level_ * 10;
		status_.hp_      = calculate_health(status_.level_, status_.hp_);
		status_.max_hp_  = status_.hp_;
    
		// Gain a new action
		for (var _i = 0; _i < array_length(class_.special_actions_); _i++) {
			var _special_action = class_.special_actions_[_i];
			if(status_.level_ == _special_action[0]) {
				ds_list_add(special_actions_, _special_action);
				var _levelup_message        = class_.name_ + " has reached level " + string(status_.level_) + ".#";
				var _special_action_message = class_.name_ + " learned the#" + _special_action[1] + " action.";
						
				with(other) {
					scr_text(_levelup_message);
					scr_text(_special_action_message);
				}
			}	
		}						
	
		return true;
	}

	return false;
}