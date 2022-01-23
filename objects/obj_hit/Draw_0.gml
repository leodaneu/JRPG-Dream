/// @description Insert description here
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(x + 1, y, string_hash_to_newline(-amount_));
draw_text(x - 1, y, string_hash_to_newline(-amount_));
draw_text(x, y + 1, string_hash_to_newline(-amount_));
draw_text(x, y - 1, string_hash_to_newline(-amount_));
draw_set_colour(c_red);
draw_text(x, y, string_hash_to_newline(-amount_));
draw_set_halign(fa_left);
draw_set_colour(c_white);