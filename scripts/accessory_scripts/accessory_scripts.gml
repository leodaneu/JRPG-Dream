function menu_option_equip_accessory() {
	//child_          = instance_create_layer(x + width_ + 4, y, "Instances", obj_equip_accessory_list_ui);
	child_          = instance_create_layer(x, y + height_ + 4, "Instances", obj_equip_accessory_list_ui);
	child_.parent_  = id;
	enabled_        = false;
}

function pickup_accessory(armor, amount) {
	if (instance_exists(obj_game)) {
	    with (obj_game) {
	        var _armor_index = ds_list_find_index(global.accessories, armor);
	        if (_armor_index != -1) {
	            global.accessories_amount[| _helmet_index] += amount;
	        } else {
	            ds_list_add(global.accessories, armor);
	            ds_list_add(global.accessories_amount, amount);
	        }
	    }
	}
}

function create_equip_accessory_option_list() {
	var _options = ds_list_create();
	    
	for (var _i = 0; _i < ds_list_size(global.accessories); _i++) {
		var _item        = global.accessories[| _i];
		var _item_number = global.accessories_amount[| _i];
				    
		var _option_text = "x" + string(_item_number) + " " + _item[? "name"];	    
		
	    if (_item_number > 1) _option_text += "s";
    
	    if (string_length(_option_text) > 13) {
	        _option_text = string_copy(_option_text, 0, 10);
	        _option_text += "...";
	    }
    		
	    _options[| _i] = create_option(_option_text, accessory_option_equip_ui)//, _item[? "name"], parent_.parent_.options_[| index_][? "name"]);
	}

	for (var _j = 0; _j < ds_list_size(_options); _j++)
	    ds_list_mark_as_map(_options, _j);

	return _options;
}

function accessory_option_equip() {
	if (instance_exists(parent_)) {
	    with (parent_) {
			if (instance_exists(obj_battle)) {
				choose_ally();
				
				if (instance_exists(obj_playable_battle_unit))           
					instance_destroy();		
			} 
	    }
		
		var _equipment = global.accessories[| parent_.index_];
		var _equipment = parent_.index_;
		var _character = parent_.parent_.parent_.options_[| index_][? "text"];
		
		equip_accessory_index(_equipment, _character);
	}
}

function equip_accessory_index(accessory, character) {
	var _accessory_index = accessory;
	var _target       = asset_get_index("obj_" + string_lower(character) + "_stats");
		
	with (_target) {
		var _accessory = ds_list_find_value(global.accessory, _accessory_index);
	    if (_accessory != undefined) {
	        if (_accessory[? "battle"] and room != room_battle) {
	            create_message_at_view_center("You cannot use this#item outside of battle.");
	            with (other.parent_) instance_destroy();
	            with (other) instance_destroy();
	            exit;
	        }
        
			with (other.parent_) {
				ds_list_destroy(options_);
				
		        options_ = create_equip_accessory_option_list();
		        index_   = min(index_, ds_list_size(options_) - 1);	
			}
			
			get_accessory_stats(_accessory);					
	    }	
	}
}

function accessory_option_equip_ui() {
	child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_armor_equip_ui);
	child_.parent_ = id;
	enabled_       = false;
}

function get_accessory_stats(accessory) {
	equipment_.accessory_1 = accessory[? "name"];
	status_.defense_ += accessory[? "defense"];
}

function accessory_option_info() {
	var _xx = x;
	var _yy = y;

	if (instance_exists(parent_)) {    
	    with (parent_) {       	       
	        var _item = ds_list_find_value(global.accessories, index_);			
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