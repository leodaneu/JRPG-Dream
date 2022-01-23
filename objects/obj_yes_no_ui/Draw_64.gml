/// @description Insert description here
// You can write your code in this editor
//event_inherited();

draw_sprite_ext(spr_textbox, 0, x, y, width_ / sprite_width_, height_ / sprite_height_, 0, c_white, 1);

for (var _i = 0; _i < ds_list_size(options_); _i++) {
    var _option = options_[| _i];
    var _color  = purple_gray_;
    if (_i == index_) _color = c_white;
    //draw_text_colour(x + 16, y + 8 + 12 * _i, string_hash_to_newline(_option[? "text"]), _color, _color, _color, _color, 1);
	draw_text_transformed_color(x + 6, y + 4 + 8 * _i, string_hash_to_newline(_option[? "text"]), .8, .8, 0, _color, _color, _color, _color, 1);
}

// Draw the caret for selecting an option 
//draw_sprite(spr_ui_caret, 0, x + 6, y + 8 + 12 * index_);