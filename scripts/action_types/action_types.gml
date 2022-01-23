// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function ClaudioActions() constructor {
	attack = {
		name_  : "Attack",
		state_ : battle_player.approaching,
		info_  : "A basic meele attack"
	}
	
	defend = {
		name_  : "Guard",
		state_ : battle_player.defend,
		info_  : "Reduces damage taken"	
	}
}