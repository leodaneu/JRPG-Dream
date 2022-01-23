function menu_option_items() {
	audio_play_sound(aud_menu_select, 2, false);
	child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_item_list_ui);
	child_.parent_ = id;
	enabled_       = false;
}

function menu_option_load() {
	create_message_at_view_center("Game loaded!");
	instance_destroy();
	load_game();
}

function menu_option_save() {
	// ini_save("save_data.ini");
	save_game();
	create_message_at_view_center("Game saved!");
	instance_destroy();
}

function menu_option_status() {
	audio_play_sound(aud_menu_select, 2, false);
	var _stats_string = "";
	
	with (obj_stats) {
		_stats_string += "Name: "   + string(class_.name_)   + "#";
	    _stats_string += "Level: "  + string(status_.level_) + "#";
	    _stats_string += "Health: " + string(status_.hp_ )   + "/" + string(status_.max_hp_)  + "#";
	    _stats_string += "Exp: "    + string(status_.exp_)   + "/" + string(status_.max_exp_) + "#" + "#";
	}
	
	_stats_string = string_delete(_stats_string, string_length(_stats_string) - 1, 1);
	
	child_         = create_message(x + width_ + 4, y, _stats_string);
	child_.parent_ = id;
	enabled_       = false;
}

function menu_option_exit() {
	if (instance_exists(obj_shop_dialog)) {
		with (obj_shop_dialog) {
			text_page_++;
		}
	}
	
	instance_destroy();
}
