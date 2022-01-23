/// @description Insert description here
// You can write your code in this editor
if (paused_) {
	var _gui_width  = display_get_gui_width();
	var _gui_height = display_get_gui_height();
	
	draw_set_alpha(.4);
	draw_rectangle_color(0, 0, _gui_width, _gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}