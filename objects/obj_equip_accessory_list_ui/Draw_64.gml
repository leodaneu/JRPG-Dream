/// @description  Draw the option static list
//event_inherited();
draw_sprite_ext(spr_textbox, 0, x, y, width_ / sprite_width_, height_ / sprite_height_, 0, c_white, 1);

for (var _i = index_; _i <= index_ + 4; _i++) {
    if (_i >= 0 and _i < ds_list_size(options_)) {
        var _option    = options_[| _i];
        var _color     = purple_gray_;
		var _character = string_lower(parent_.parent_.options_[| parent_.parent_.index_][? "text"]);
		var _obj_stats = asset_get_index("obj_" + _character + "_stats");
				
		var _is_equiped = string_pos(_obj_stats.equipment_.accessory_1_, options_[| index_][? "text"]);
		if (_i == index_ and _is_equiped == 0) 
			_color = c_white;
        
		draw_text_colour(x + 6, y + 6 + 10 * (_i - index_), string_hash_to_newline(_option[? "text"]), _color, _color, _color, _color, 1);
    }
}

//draw_sprite(spr_ui_caret, 0, x + 6, y + 6 + 10 * 2);