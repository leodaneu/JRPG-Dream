/// @description  Initialize the Battle UI
event_inherited();
index_           = 0;
character_index_ = noone;
purple_gray_     = make_colour_rgb(145,145, 175);

options_ = ["Action", "Item", "Skill", "Run"];

enum battle_action {
	action,
	item,
	run,
	special_action
};