function menu_option_equip_armor() {
	//child_          = instance_create_layer(x + width_ + 4, y, "Instances", obj_equip_armor_list_ui);
	child_          = instance_create_layer(x, y + height_ + 4, "Instances", obj_equip_armor_list_ui);
	child_.parent_  = id;
	enabled_        = false;
}

function pickup_armor(armor, amount) {
	if (instance_exists(obj_game)) {
	    with (obj_game) {
	        var _armor_index = ds_list_find_index(global.armors, armor);
	        if (_armor_index != -1) {
	            global.armors_amount[| _helmet_index] += amount;
	        } else {
	            ds_list_add(global.armors, armor);
	            ds_list_add(global.armors_amount, amount);
	        }
	    }
	}
}

function create_equip_armor_option_list() {
	var _options = ds_list_create();
	    
	for (var _i = 0; _i < ds_list_size(global.armors); _i++) {
		var _item        = global.armors[| _i];
		var _item_number = global.armors_amount[| _i];
				    
		//var _option_text = "x" + string(_item_number) + " " + _item[? "name"];	    
		var _option_text = _item[? "name"];	    
		
	    //if (_item_number > 1) _option_text += "s";
    
	    if (string_length(_option_text) > 9) {
	        _option_text = string_copy(_option_text, 0, 10);
	        _option_text += "...";
	    }
    		
	    _options[| _i] = create_option(_option_text, armor_option_equip_ui);
	}

	for (var _j = 0; _j < ds_list_size(_options); _j++)
	    ds_list_mark_as_map(_options, _j);

	return _options;
}

function armor_option_equip() {
	if (instance_exists(parent_)) {
	    with (parent_) {
			if (instance_exists(obj_battle)) {
				choose_ally();
				
				if (instance_exists(obj_playable_battle_unit))           
					instance_destroy();		
			} 
	    }
		
		var _equipment = global.armors[| parent_.index_];
		var _equipment = parent_.index_;
		var _character = parent_.parent_.parent_.options_[| index_][? "text"];
		
		equip_armor_index(_equipment, _character);
	}
}

function equip_armor_index(armor, character) {
	var _armor_index = armor;
	var _target       = asset_get_index("obj_" + string_lower(character) + "_stats");
		
	with (_target) {
		var _armor = ds_list_find_value(global.armors, _armor_index);
	    if (_armor != undefined) {
	        if (_armor[? "battle"] and room != room_battle) {
	            create_message_at_view_center("You cannot use this#item outside of battle.");
	            with (other.parent_) instance_destroy();
	            with (other) instance_destroy();
	            exit;
	        }
        
			with (other.parent_) {
				ds_list_destroy(options_);
				
		        options_ = create_equip_armor_option_list();
		        index_   = min(index_, ds_list_size(options_) - 1);	
			}
			
			get_armor_stats(_armor);					
	    }	
	}
}

function get_armor_stats(armor) {
	equipment_.armor_ = armor[? "name"];
	status_.defense_ += armor[? "defense"];
}

function armor_option_equip_ui() {
	child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_armor_equip_ui);
	child_.parent_ = id;
	enabled_       = false;
	
}

function armor_option_info() {
	var _xx = x;
	var _yy = y;

	if (instance_exists(parent_)) {    
	    with (parent_) {       	       
	        var _item = ds_list_find_value(global.armors, index_);			
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