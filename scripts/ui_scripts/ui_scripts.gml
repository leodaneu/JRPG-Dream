/// @param text
/// @param script
/// @param [item]
/// @param [character]
function create_option(text, script) {
	var _option         = ds_map_create();
	_option[? "text"]   = text;
	_option[? "script"] = script;
	
	if (argument_count > 2) {
		var _item          = argument[2];
		var _character     = argument[3];
		_option[? "arg_1"] = _item;
		_option[? "arg_2"] = _character;
	}

	return _option;
}

function create_option_icon(icon, script) {
	var _option         = ds_map_create();
	_option[? "icon"]   = icon;
	_option[? "script"] = script;
	
	if (argument_count > 2) {
		var _item          = argument[2];
		var _character     = argument[3];
		_option[? "arg_1"] = _item;
		_option[? "arg_2"] = _character;
	}

	return _option;
}

//function action_option_info() {
//	if (instance_exists(parent_)) {    
//	    with (parent_) {       
//	        with (obj_player_stats) {
//	            var _action = ds_list_find_value(actions_, other.index_);
	            
//				if (_action != undefined) 
//	                var _message = create_message(x, y, _action[? "info"]);
//	             else 
//	                exit;
//	        }
//	    }
//	}

//	visible        = false;
//	child_         = _message;
//	child_.parent_ = id;
//	enabled_       = false;
//}

function action_option_info() {    
	with (obj_battle_ui.character_index_) {       
		var _action = stats_object_.actions_[| other.parent_.index_];
				
		if (_action != undefined) 
			var _message = create_message(x, y, _action.info_);
	    else 
	        exit;
	}
	
	visible        = false;
	child_         = _message;
	child_.parent_ = id;
	enabled_       = false;
}


function action_option_use() {
	with (obj_battle_ui.character_index_) {	
	    var _action = stats_object_.actions_[| other.parent_.index_];
	
	    if (_action.name_ == "Guard") {
			state_           = _action.state_;
			action_meter_    = 0;
			obj_battle.play_ = true;
			
			with(obj_enemy_battle_unit)
				state_ = battle_player.idle;
				
	        //script_execute(asset_get_index(_action.state_));
			
	    } else if(_action.name_ == "Attack" and object_index != obj_enemy_battle_unit) {
			choose_target();
			obj_target_cursor.action_ = _action;
		
			//var _script = asset_get_index(_action[? "action"]);
			//script_execute(_script);
		} 
		//else {		
	    //    // state_ = asset_get_index(_action[? "action"]);
		//	var _script = asset_get_index(_action[? "action"]);
		//	script_execute(_script);
	    //}
	}

	with (parent_)
	    instance_destroy();
}

function action_option_use_ui() {
	child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_action_use_ui);
	child_.parent_ = id;
	enabled_       = false;
}

function create_message_at_view_center(text) {
	var _message_ui = create_message(0, 0, text);

	with (_message_ui) {
	    x = (display_get_gui_width() / 2) - width_ / 2;
	    y = (display_get_gui_height() / 2) - height_ / 2;
	}

	return _message_ui;
}

function create_message(x, y, text) {
	if (!instance_exists(obj_message_ui)) {
		var _message_ui = instance_create_layer(x, y, "Instances", obj_message_ui);

		with (_message_ui) {
		    message_ = text;
		    width_   = string_width(string_hash_to_newline(text));// + 12;
		    height_  = string_height(string_hash_to_newline(text)) + 12;
		}

		return _message_ui;
	}	
}

function create_question(xx, yy, text, option_ui_object) {
	var _message_ui = instance_create_layer(0, 0, "Instances", obj_message_ui);

	with (_message_ui) {
	    message_       = text;
	    width_         = string_width(string_hash_to_newline(text));//  + 16;
	    height_        = string_height(string_hash_to_newline(text)) + 16;
	    x              = xx;
	    y              = yy;    
	    child_         = instance_create_layer(x + width_ + 4, y, "Instances", option_ui_object);
		child_.parent_ = id;
	    enabled_       = false;
	}
}

function draw_nine_slice(sprite, x1, y1, x2, y2) {
	var _slice_w = sprite_get_width(sprite) / 3;
	var _slice_h = sprite_get_height(sprite) / 3;
	var _width   = x2 - x1;
	var _height  = y2 - y1;

	// Top
	draw_sprite_part_ext(sprite, 0, 0, 0, _slice_w, _slice_h, x1, y1, 1, 1, c_white, 1);
	draw_sprite_part_ext(sprite, 0, _slice_w, 0, _slice_w, _slice_h, x1 + _slice_w, y1, (_width - _slice_w * 2) / _slice_w, 1, c_white, 1);
	draw_sprite_part_ext(sprite, 0, _slice_w * 2, 0, _slice_w, _slice_h, x2 - _slice_w, y1, 1, 1, c_white, 1);

	// Middle
	draw_sprite_part_ext(sprite, 0, 0, _slice_w, _slice_w, _slice_h, x1, y1 + _slice_h, 1, (_height - _slice_h * 2) / _slice_h, c_white, 1);
	draw_sprite_part_ext(sprite, 0, _slice_w, _slice_w, _slice_w, _slice_h, x1 + _slice_w, y1 + _slice_h, (_width - _slice_w * 2) / _slice_w, (_height - _slice_h * 2) / _slice_h, c_white, 1);
	draw_sprite_part_ext(sprite, 0, _slice_w * 2, _slice_w, _slice_w, _slice_h, x2 - _slice_w, y1 + _slice_h, 1, (_height - _slice_h * 2) / _slice_h, c_white, 1);

	// Bottom
	draw_sprite_part_ext(sprite, 0, 0, _slice_h * 2, _slice_w, _slice_h * 2, x1, y1 + _height - _slice_h, 1, 1, c_white, 1);
	draw_sprite_part_ext(sprite, 0, _slice_w, _slice_h * 2, _slice_w, _slice_h, x1 + _slice_w, y1 + _height - _slice_h, (_width - _slice_w * 2) / _slice_w, 1, c_white, 1);
	draw_sprite_part_ext(sprite, 0, _slice_w * 2, _slice_h * 2, _slice_w, _slice_h, x2 - _slice_w, y2 - _slice_h, 1, 1, c_white, 1);
}

function format_text(text, width, font) {
	//draw_set_font(font);
 
	var _array_size = array_length(text);
	var _last_space = 0;

	for (var _i = 0; _i < _array_size; _i++) {
	    var _count = 0;
	    var _char  = string_char_at(text[_i], _count);
		
	    while (_char != "") {
	        var _str       = string_copy(text[_i], 1, _count);
	        var _str_width = string_width(string_hash_to_newline(_str));

	        if (_char == " ") 
				_last_space = _count;
        
	        if (_str_width > width) {
	            text[@ _i] = string_delete(text[_i], _last_space, 1);
	            text[@ _i] = string_insert("#", text[_i], _last_space);
	        }
        
	        _count++;
	        _char = string_char_at(text[@ _i], _count);
	    }
	}
	//return text;
}

function get_visible_text(pause_time) {
	var _new_string = string_copy(text_[text_page_], 1, text_count_);
	
	if (string_length(_new_string) > string_length(text_visible_)) {
		var _last_char = string_char_at(_new_string, text_count_);
		if (_last_char != " " and _last_char != "#" and _last_char != "") {
		    //audio_emitter_gain(emitter_, random_range(.3, .5) * o_audio_player.sfx_volume_);
		    //audio_emitter_pitch(emitter_, random_range(voice_pitch_ - .1, voice_pitch_ + .1));
		    //audio_play_sound_on(emitter_, voice_, false, 10);
		}
    
		if ((_last_char == "." or _last_char == "," or _last_char == "!" or _last_char == "?") and text_count_ < string_length(text_[text_page_])) {
		    alarm[0] = pause_time;
		}
    
		text_visible_ = _new_string;
	}
}