/// @description  Navigate the options
if (!enabled_) { 
	for (var _i = 0; _i < ds_list_size(global.inventory); _i++) {
		var _item        = global.inventory[| _i];
		var _item_number = global.inventory_amount[| _i];
		var _option_text = "x" + string(_item_number) + " " + _item[? "name"];
			
		//if (_item_number > 1) _option_text += "s";
    
		if (string_length(_option_text) > 9) {
			_option_text = string_copy(_option_text, 0, 10);
			_option_text += "...";
		}
	
		ds_list_destroy(options_);
		options_ = create_items_option_list();
	    index_   = min(index_, ds_list_size(options_) - 1);
		//options_[| _i][? "text"] = _option_text;
	}
	exit;
}
	
if (obj_input.down_pressed_ - obj_input.up_pressed_ != 0) {
	audio_play_sound(aud_menu_move, 2, false);
}

index_ += obj_input.down_pressed_ - obj_input.up_pressed_;
index_ = clamp(index_, 0, ds_list_size(options_) - 1);

if (obj_input.back_)
    instance_destroy();

if (obj_input.action_ and ds_list_size(options_) > 0) {
    var _option = options_[| index_];
    script_execute(_option[? "script"]);
}