/// @description  Draw the option static list
event_inherited();

for (var _i = index_ - 2; _i <= index_ + 2; _i++) {
    if (_i >= 0 and _i < ds_list_size(options_)) {
        var _option = options_[| _i];
        var _color  = purple_gray_;
        
		if (_i == index_) 
			_color = c_white;
        
		draw_text_colour(x + 16, y + 6 + 10 * (_i + 2 - index_), string_hash_to_newline(_option[? "text"]), _color, _color, _color, _color, 1);
    }
}

draw_sprite(spr_ui_caret, 0, x + 6, y + 6 + 10 * 2);