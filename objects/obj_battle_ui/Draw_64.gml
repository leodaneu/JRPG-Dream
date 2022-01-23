/// @description  Draw the Battle UI
draw_self();

for (var _i = 0; _i < 3; _i++) {
	var _color = purple_gray_;
	
	if (_i == index_) 
		_color = c_white;
		
	
	//draw_text_colour(x - 54 + 48 * _i, y - 5, options_[_i], _color, _color, _color, _color, 1);
	//draw_text_colour(x + 16 + _i * 16 * string_length(options_[_i]), y - 5, options_[_i], _color, _color, _color, _color, 1);
	draw_text_transformed_color(x + 6 + _i  * 40, y - 5, options_[_i], .8, .8, 0, _color, _color, _color, _color, 1);
}		
		
//draw_text(x - 40, y, "Action");
//draw_text(x + 4, y, "Item");
//draw_text(x + 48, y, "Run");

//draw_sprite_ext(spr_battle_ui_action, 0, x - 40, y, 1, 1, 0, make_colour_hsv(0, 0, 127 + 128 * (index_ == 0)), 1);
//draw_sprite_ext(spr_battle_ui_item, 0, x + 4, y, 1, 1, 0, make_colour_hsv(0, 0, 127 + 128 * (index_ == 1)), 1);
//draw_sprite_ext(spr_battle_ui_run, 0, x + 48, y, 1, 1, 0, make_colour_hsv(0, 0, 127 + 128 * (index_ == 2)), 1);

