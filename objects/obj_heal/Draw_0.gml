/// @description  Draw the hit text
var _heal_string = "+" + string(amount_);

draw_set_halign(fa_center);
draw_set_colour(c_black);
draw_text(x + 1, y, string_hash_to_newline(_heal_string));
draw_text(x - 1, y, string_hash_to_newline(_heal_string));
draw_text(x, y + 1, string_hash_to_newline(_heal_string));
draw_text(x, y - 1, string_hash_to_newline(_heal_string));
draw_set_colour(c_aqua);
draw_text(x, y, string_hash_to_newline(_heal_string));
draw_set_halign(fa_left);
draw_set_colour(c_white);
