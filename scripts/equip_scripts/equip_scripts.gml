function equipment_option_equip_ui() {
	audio_play_sound(aud_menu_select, 2, false);
	child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_equip_equip_ui);
	child_.parent_ = id;
	enabled_       = false;
	
}

function menu_option_equip_type() {
	audio_play_sound(aud_menu_select, 2, false);
	//child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_equip_type_ui);
	child_         = instance_create_layer(x, y + height_ + 4, "Instances", obj_equip_type_ui);
	child_.parent_ = id;
	enabled_       = false;
}

function menu_option_party_equip() {
	audio_play_sound(aud_menu_select, 2, false);
	child_          = instance_create_layer(x + width_ + 4, y, "Instances", obj_party_list_ui);
	child_.parent_  = id;
	enabled_        = false;
}

//function create_party_option_list_equip() {
//	var _options       = ds_list_create();
//	var _party_size    = ds_map_size(obj_game.party_);
//	var _character     = ds_map_find_first(obj_game.party_);
//	var _option_text   = obj_game.party_[? _character].name_;
//	var _index         = 0;
//	_options[| _index] = create_option(_option_text, menu_option_equip_type);//, parent_.index_, string_lower(_option_text));
//	//_options[| _index] = create_option(_option_text, equip_equipment_index, parent_.index_, string_lower(_option_text));
//	show_message(_character)
//	repeat(_party_size - 1) {
//		_character         = ds_map_find_next(obj_game.party_, _character);
//		_option_text       = obj_game.party_[? _character].name_;
//		_options[| _index] = create_option(_option_text, menu_option_equip_type);//, parent_.index_, string_lower(_option_text));
//		//_options[| _index] = create_option(_option_text, equip_equipment_index, parent_.index_, string_lower(_option_text));
//		_index++;
//	}

//	for (var _j = 0; _j < ds_list_size(_options); _j++)
//	    ds_list_mark_as_map(_options, _j);
//	return _options;
//}

function create_party_option_list_equip() {
	var _index   = 0;
	var _options = ds_list_create();
	var _option_text;
	
	for (var _character = ds_list_find_value(obj_game.party_order_, _index); !is_undefined(_character); _character = ds_list_find_value(obj_game.party_order_, _index)) {
		_option_text       = obj_game.party_[? _character].name_;
		_options[| _index] = create_option(_option_text, menu_option_equip_type);
		_index++;
	}
	
	for (var _j = 0; _j < ds_list_size(_options); _j++)
	    ds_list_mark_as_map(_options, _j);

	return _options;
}

function equip_equipment_index(item_index, character, type) {
	var _item_index = item_index;
	var _target     = asset_get_index("obj_" + string_lower(character) + "_stats");
		
	with (_target /*obj_stats*/) {
		var _item = ds_list_find_value(global.weapons, _item_index);
	    if (_item != undefined) {
	        if (_item[? "battle"] and room != room_battle) {
	            create_message_at_view_center("You cannot use this#item outside of battle.");
	            with (other.parent_) instance_destroy();
	            with (other) instance_destroy();
	            exit;
	        }
        
			with (other.parent_) {
				ds_list_destroy(options_);
				
		        options_ = create_equip_option_list();
		        index_   = min(index_, ds_list_size(options_) - 1);	
			}
			
			get_equipment_stats(_item);					
	    }	
	}
}

function get_equipment_stats(equipment) {
	equipment_.weapon_ = equipment[? "name"];
	status_.strength_ += equipment[? "strength"];
	status_.speed_ += equipment[? "speed"];
}