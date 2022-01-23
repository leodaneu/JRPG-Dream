/// @description  Draw the option static list
//event_inherited();
draw_sprite_ext(spr_textbox, 0, x, y, width_ / sprite_width_, height_ / sprite_height_, 0, c_white, 1);

//for (var _i = index_ div 8; _i <= (index_ div 8) + 7; _i++) {
for (var _i = index_; _i <= index_ + 7; _i++) {
//for (var _i = 0; _i <= ds_list_size(options_); _i++) {
    if (/*_i >= 0 and */_i < ds_list_size(options_)) {
        var _option = options_[| _i];
        var _color  = purple_gray_;
		
		if (_i == index_) 
			_color = c_white;
        
		//draw_text_colour(x + 16, y + 6 + 10 * (_i + 2 - index_), string_hash_to_newline(_option[? "text"]), _color, _color, _color, _color, 1);
		//draw_text_colour(x + 4, y + 6 + 10 * (_i + 2 - index_), string_hash_to_newline(_option[? "text"]), _color, _color, _color, _color, 1);
		//draw_text_colour(x + 4, y + 6 + 10 * (_i - index_), string_hash_to_newline(_option[? "text"]), _color, _color, _color, _color, 1);
		draw_text_transformed_color(x + 6, y + 6 + 10 * (_i - index_), string_hash_to_newline(_option[? "text"]), .8, .8, 0, _color, _color, _color, _color, 1);
		//draw_text_transformed_color(x + 6, y + 6 + 10 * (_i - (index_ div 8)), string_hash_to_newline(_option[? "text"]), .8, .8, 0, _color, _color, _color, _color, 1);	
	}
}

if (enabled_) {
	//draw_sprite(spr_cursor, image_index / 6, x + 2, y + 8 + 8 * index_);
	//draw_sprite_ext(spr_cursor, image_index / 6, x - 4, y + 6 + 10 * index_, .8, .8, 0, c_white, 1);
}

//draw_sprite(spr_ui_caret, 0, x + 6, y + 6 + 10 * 2);