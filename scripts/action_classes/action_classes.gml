// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Action() constructor{
	name_  = "";
	state_ = 0;
	info_  = "";
}

function Attack() constructor {
	name_  = "Attack";
	state_ = battle_player.approaching;
	info_  = "A basic melee attack";	
}

function Guard() constructor {
	name_  = "Guard";
	state_ = battle_player.defend;
	info_  = "Reduces damage taken";	
}

function Ranged() : Action() constructor {
	x_offset_  = 0;
	y_offset_  = 0;
	hit_frame_ = 0;
}