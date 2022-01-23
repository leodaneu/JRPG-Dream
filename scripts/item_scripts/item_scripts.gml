function create_items_option_list() {
	var _options = ds_list_create();

	for (var _i = 0; _i < ds_list_size(global.inventory); _i++) {
	    var _item        = global.inventory[| _i];
	    var _item_number = global.inventory_amount[| _i];
	    var _option_text = "x" + string(_item_number) + " " + _item[? "name"];
		
	    //if (_item_number > 1) _option_text += "s";
    
	    if (string_length(_option_text) > 9) {
	        _option_text = string_copy(_option_text, 0, 10);
	        _option_text += "...";
	    }
    
	    _options[| _i] = create_option(_option_text, item_option_use_ui);
	}

	for (var _j = 0; _j < ds_list_size(_options); _j++)
	    ds_list_mark_as_map(_options, _j);

	return _options;
}

function create_party_option_list() {
	var _options       = ds_list_create();
	var _party_size    = ds_map_size(obj_game.party_);
	var _character     = ds_map_find_first(obj_game.party_);
	var _option_text   = obj_game.party_[? _character].name_;
	var _index         = 0;
	_options[| _index] = create_option(_option_text, use_item_index, parent_.index_, string_lower(_option_text));
	
	repeat(_party_size - 1) {
		_character         = ds_map_find_next(obj_game.party_, _character);
		_option_text       = obj_game.party_[? _character].name_;
		_options[| _index] = create_option(_option_text, use_item_index, parent_.index_, string_lower(_option_text));
		_index++;
	}

	for (var _j = 0; _j < ds_list_size(_options); _j++)
	    ds_list_mark_as_map(_options, _j);

	return _options;
}

function item_option_use_ui() {
	child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_item_use_ui);
	child_.parent_ = id;
	enabled_       = false;
}

function item_option_use() {		
	if (instance_exists(parent_)) {
	    with (parent_) {
			if (instance_exists(obj_battle)) {
				choose_ally();
				
				if (instance_exists(obj_playable_battle_unit))           
					instance_destroy();		
			} 
	    }
		
		if (!instance_exists(obj_battle))
			menu_option_party();
	}
}

function menu_option_party() {
	child_          = instance_create_layer(x + width_ + 4, y, "Instances", obj_party_list_ui);
	child_.parent_  = id;
	enabled_        = false;
	child_.options_ = create_party_option_list();
}

function item_option_drop() {
	if (instance_exists(parent_)) {    
	    with (parent_) {
	        if (ds_list_size(global.inventory) > 0) {
	            global.inventory_amount[| index_]--;            
				
				if (global.inventory_amount[| index_] <= 0) {
	                ds_list_delete(global.inventory_amount, index_);
	                ds_list_delete(global.inventory, index_);
	            }
				
	            ds_list_destroy(options_);
				
	            options_ = create_items_option_list();
	            index_   = min(index_, ds_list_size(options_) - 1);
	        }
	    }
	}
}

function item_option_info() {
	var _xx = x;
	var _yy = y;

	if (instance_exists(parent_)) {   
	    with (parent_) {       	       
	        var _item = ds_list_find_value(global.inventory, index_);			
			if (_item != undefined)
	            var _message = create_message(_xx, _yy, _item[? "info"]);
	        else
	            exit;        
	    }
	}

	visible        = false;
	child_         = _message;
	child_.parent_ = id;
	enabled_       = false;
}

function inventory_add_item(item) {
	var _item = singleton(item);

	var _item_index = array_find_index(_item, global.inventory);

	if (_item_index == -1) {	
		var _array_length = array_length(global.inventory);
	
		for (var _i = 0; _i < _array_length; _i++) {
			if (global.inventory[_i] == noone) {
				global.inventory[_i] = _item;
				return true;
			}
		}
	} else
		return true;	

	return false;
}


function use_item_index(item_index, character) {
	
	var _item_index = item_index;
	var _target     = asset_get_index("obj_" + character + "_stats");
	
	with (_target) {
	    //var _item = ds_list_find_value(items_, _item_index);
		var _item = ds_list_find_value(global.inventory, _item_index);
	    if (_item != undefined) {
	        if (_item[? "battle"] and room != room_battle) {
	            create_message_at_view_center("You cannot use this#item outside of battle.");
	            with (other.parent_) instance_destroy();
	            with (other) instance_destroy();
	            exit;
	        }
	
	        global.inventory_amount[| _item_index]--;
        
	        if (global.inventory_amount[| _item_index] <= 0) {
	            ds_list_delete(global.inventory_amount, _item_index);
	            ds_list_delete(global.inventory, _item_index);
	        }
			
			if (room != room_battle) {
				with (other.parent_.parent_) {				
					ds_list_destroy(options_);
				
			        options_ = create_items_option_list();
			        index_   = min(index_, ds_list_size(options_) - 1);	
				}
			}
									        
	        script_execute(asset_get_index(_item[? "effect"]), _item[? "arguments"]);						
	    }		
	}
}

function pickup_item(item, amount) {
	if (instance_exists(obj_game)) {
	    with (obj_game) {
	        var _item_index = ds_list_find_index(global.inventory, item);
	        if (_item_index != -1) {
	            global.inventory_amount[| _item_index] += amount;
	        } else {
	            ds_list_add(global.inventory, item);
	            ds_list_add(global.inventory_amount, amount);
	        }
	    }
	}
}

function heal_effect(args_list) {
	var _amount = args_list[| 0];
	
	class_.status_.hp_ += _amount;
	class_.status_.hp_ = min(class_.status_.hp_, class_.status_.max_hp_);
	
	var _unit = class_.battle_unit_;
	//if (instance_exists(obj_stats)) {
	//   with (obj_stats) {
	//        class_.status_.hp_ += _amount;
	//        class_.status_.hp_ = min(class_.status_.hp_, class_.status_.max_hp_);
	//    }
	//}

	with (other) {
		if (/*instance_exists(obj_player_battle_unit)*/ room == room_battle) {
			//var _effect          = instance_create_layer(obj_player_battle_unit.x, obj_player_battle_unit.bbox_top, "Effects", obj_animation_effect);
			var _effect          = instance_create_layer(_unit.x, _unit.bbox_top, "Effects", obj_animation_effect);
			_effect.sprite_index = spr_heal_effect;
			_effect.image_speed  = .1;
			_effect.depth        = -y;
	    
			//instance_create_layer(obj_player_battle_unit.x, obj_player_battle_unit.y, obj_heal_particle_effect);
		    //var _heal     = instance_create_layer(obj_player_battle_unit.x, obj_player_battle_unit.bbox_top, "Instances", obj_heal);
			var _heal     = instance_create_layer(_unit.x, _unit.bbox_top, "Instances", obj_heal);
		    _heal.amount_ = _amount;
		} else {
			var _effect          = instance_create_layer(obj_player.x + 8, obj_player.y + 32, "Effects", obj_animation_effect);
			_effect.sprite_index = spr_heal_effect;
			_effect.image_speed  = .1;
			_effect.depth        = -y;
		
		    // instance_create_layer(obj_player.x + 8, obj_player.y + 32, obj_heal_particle_effect);
		    var _heal     = instance_create_layer(obj_player.x + 8, obj_player.bbox_top - 18, "Instances", obj_heal);
		    _heal.amount_ = _amount;
		}	
	}
	
}