function menu_option_equip_helmet() {
	//child_          = instance_create_layer(x + width_ + 4, y, "Instances", obj_equip_helmet_list_ui);
	child_          = instance_create_layer(x, y + height_ + 4, "Instances", obj_equip_helmet_list_ui);	
	child_.parent_  = id;
	enabled_        = false;
}

function pickup_helmet(helmet, amount) {
	if (instance_exists(obj_game)) {
	    with (obj_game) {
	        var _helmet_index = ds_list_find_index(global.helmets, helmet);
	        if (_helmet_index != -1) {
	            global.helmets_amount[| _helmet_index] += amount;
	        } else {
	            ds_list_add(global.helmets, helmet);
	            ds_list_add(global.helmets_amount, amount);
	        }
	    }
	}
}

function create_equip_helmet_option_list() {
	var _options = ds_list_create();
	    
	for (var _i = 0; _i < ds_list_size(global.helmets); _i++) {
		var _item        = global.helmets[| _i];
		var _item_number = global.helmets_amount[| _i];
				    
		//var _option_text = "x" + string(_item_number) + " " + _item[? "name"];
		var _option_text = _item[? "name"];	    
		
	    if (_item_number > 1) _option_text += "s";
    
	    if (string_length(_option_text) > 8) {
	        _option_text = string_copy(_option_text, 0, 10);
	        _option_text += "...";
	    }
    		
	    _options[| _i] = create_option(_option_text, helmet_option_equip_ui);
	}

	for (var _j = 0; _j < ds_list_size(_options); _j++)
	    ds_list_mark_as_map(_options, _j);

	return _options;
}

function helmet_option_equip_ui() {
	child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_helmet_equip_ui);
	child_.parent_ = id;
	enabled_       = false;
}

function helmet_option_equip() {
	if (instance_exists(parent_)) {
	    with (parent_) {
			if (instance_exists(obj_battle)) {
				choose_ally();
				
				if (instance_exists(obj_playable_battle_unit))           
					instance_destroy();		
			} 
	    }
		
		var _equipment = global.helmets[| parent_.index_]
		var _equipment = parent_.index_;
		var _character = parent_.parent_.parent_.options_[| index_][? "text"];
		
		equip_helmet_index(_equipment, _character);
	}
}

function equip_helmet_index(helmet, character) {
	var _helmet_index = helmet;
	var _target       = asset_get_index("obj_" + string_lower(character) + "_stats");
		
	with (_target) {
		var _helmet = ds_list_find_value(global.armors, _helmet_index);
	    if (_helmet != undefined) {
	        if (_helmet[? "battle"] and room != room_battle) {
	            create_message_at_view_center("You cannot use this#item outside of battle.");
	            with (other.parent_) instance_destroy();
	            with (other) instance_destroy();
	            exit;
	        }
        
			with (other.parent_) {
				ds_list_destroy(options_);
				
		        options_ = create_equip_helmet_option_list();
		        index_   = min(index_, ds_list_size(options_) - 1);	
			}
			
			get_helmet_stats(_helmet);					
	    }	
	}
}

function get_helmet_stats(helmet) {
	equipment_.helmet_ = helmet[? "name"];
	status_.defense_ += helmet[? "defense"];
}

function helmet_option_info() {
	var _xx = x;
	var _yy = y;

	if (instance_exists(parent_)) {    
	    with (parent_) {       	       
	        var _item = ds_list_find_value(global.helmets, index_);			
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