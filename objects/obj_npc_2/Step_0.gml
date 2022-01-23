/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(obj_textbox) and !instance_exists(obj_ui_parent)) {
	obj_player.state_ = player.move;
}