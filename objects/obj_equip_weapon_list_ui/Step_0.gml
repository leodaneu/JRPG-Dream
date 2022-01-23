/// @description  Navigate the options
var _input_value = obj_input.right_pressed_ - obj_input.left_pressed_;

if (_input_value != 0 and child_ == noone) {
	audio_play_sound(aud_menu_move, 2, false);
	with(parent_) {	
		index_ += _input_value;		
		index_ = clamp(index_, 0, ds_list_size(options_) - 1);
		var _option = options_[| index_];
		script_execute(_option[? "script"]);
	}
	
	ds_list_destroy(options_);
	instance_destroy(id, false);
	exit;
}

if (!enabled_) {
	for (var _i = 0; _i < ds_list_size(global.weapons); _i++) {
		var _item        = global.weapons[| _i];
		var _item_number = global.weapons_amount[| _i];
		//var _option_text = "x" + string(_item_number) + " " + _item[? "name"];
		var _option_text = _item[? "name"];			
		//if (_item_number > 1) _option_text += "s";
    
		if (string_length(_option_text) > 7) {
			_option_text = string_copy(_option_text, 0, 10);
			_option_text += "...";
		}
	
		//ds_list_destroy(options_);
		//options_ = create_equip_weapon_option_list();
	    //index_   = min(index_, ds_list_size(options_) - 1);
	}
	exit;
}

if (obj_input.down_pressed_ - obj_input.up_pressed_ != 0) {
	audio_play_sound(aud_menu_move, 2, false);
}

index_ += obj_input.down_pressed_ - obj_input.up_pressed_;
index_ = clamp(index_, 0, ds_list_size(options_) - 1);

if (obj_input.back_) {
	instance_destroy();
	instance_destroy(parent_);
}	

if (obj_input.action_ and ds_list_size(options_) > 0) {
    var _option = options_[| index_];
    script_execute(_option[? "script"]);
}