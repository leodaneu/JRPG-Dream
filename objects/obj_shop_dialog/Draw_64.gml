/// @description  Draw the vignette
draw_sprite_ext(spr_dialog_shadow, 0, 0, 0, 1, 1, 0, c_white, .6);

//draw_sprite(sprite_index, 0, pos_x_, pos_y_);
//draw_sprite_ext(spr_textbox, 0, x, y, (x2_ - x1_) / sprite_width_, (y2_ - y1_) / sprite_height_, 0, c_white, 1);

// TEXTBOX
draw_sprite_ext(spr_textbox, 0, textbox_x1_, textbox_y1_, textbox_x2_, textbox_y2_, 0, c_white, 1);
// PORTRAIT
draw_sprite_ext(spr_textbox, 0, portrait_x1_ - 5, portrait_y1_ - 4, portrait_x2_, portrait_y2_, 0, c_white, 1);
draw_sprite(portrait_, 0, portrait_x1_ - 1, portrait_y1_);
draw_set_font(global.font);
draw_set_halign(fa_left);
// TEXT
draw_text_ext_colour(textbox_x1_ + margin_ + 3, textbox_y1_ + margin_ + 3, string_hash_to_newline(text_visible_), -1, width_ - (margin_ * 2), c_black, c_black, c_black, c_black, 1);
draw_text_ext_colour(textbox_x1_ + margin_ + 2, textbox_y1_ + margin_ + 2, string_hash_to_newline(text_visible_), -1, width_ - (margin_ * 2), c_white, c_white, c_white, c_white, 1);
//draw_text_ext_colour(pos_x_ + margin_ + 3, pos_y_ + margin_ + 3, string_hash_to_newline(text_visible_), -1, width_ - (margin_ * 2), c_black, c_black, c_black, c_black, 1);
//draw_text_ext_colour(pos_x_ + margin_ + 2, pos_y_ + margin_ + 2, string_hash_to_newline(text_visible_), -1, width_ - (margin_ * 2), c_white, c_white, c_white, c_white, 1);

if (alarm[0] <= 0)
	text_count_ += spd_;
