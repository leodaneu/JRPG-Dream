/// @description  Draw the option list
draw_sprite_ext(spr_textbox, 0, x, y, width_ / sprite_width_, height_ / sprite_height_, 0, c_white, 1);
//draw_nine_slice(spr_textbox, x, y, x + width_, y + height_);

for (var _i = 0; _i < ds_list_size(options_); _i++) {
    var _option = options_[| _i];
    var _color  = purple_gray_;
    if (_i == index_) _color = c_white;
    //draw_text_colour(x + 16, y + 8 + 12 * _i, string_hash_to_newline(_option[? "text"]), _color, _color, _color, _color, 1);
	draw_text_transformed_color(x + 8, y + 6 + 8 * _i, string_hash_to_newline(_option[? "text"]), .8, .8, 0, _color, _color, _color, _color, 1);
}