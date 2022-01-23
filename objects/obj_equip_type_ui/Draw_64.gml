//event_inherited();

//enabled_ = true;
//child_   = noone;
//parent_  = noone;
//depth    = depth - 500;
draw_sprite_ext(spr_textbox, 0, x, y, width_ / sprite_width_, height_ / sprite_height_, 0, c_white, 1);

for (var _i = 0; _i < ds_list_size(options_); _i++) {
    var _option = options_[| _i];
    var _color  = purple_gray_;
    
	if (_i == index_) 
		_color = c_white;
	
	//draw_sprite_ext(_option[? "icon"], 0, x + 16, y + 8 + 12 * _i, 1, 1, 0, _color, 1);
	draw_sprite_ext(_option[? "icon"], 0, x + 12 + 16 * _i, y + 12, 1, 1, 0, _color, 1);
    //draw_text_colour(x + 16, y + 8 + 12 * _i, string_hash_to_newline(_option[? "text"]), _color, _color, _color, _color, 1);
}

// Draw the caret for selecting an option 
// draw_sprite(spr_ui_caret, 0, x + 6, y + 8 + 12 * index_);