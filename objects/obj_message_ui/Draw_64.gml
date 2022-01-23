/// @description  Draw the message and the options
event_inherited();

draw_sprite_ext(spr_textbox, 0, x, y, width_ / sprite_width_, height_ / sprite_height_, 0, c_white, 1);
// draw_nine_slice(spr_textbox, x, y, x + width_, y + height_);
draw_text_transformed_color(x + 6, y + 7, string_hash_to_newline(message_), .8, .8, 0, c_white, c_white, c_white, c_white, 1);
//draw_text_colour(x + 6, y + 7, string_hash_to_newline(message_), c_white, c_white, c_white, c_white, 1);
//draw_text(x + 6, y + 7, string_hash_to_newline(message_));