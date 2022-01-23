function Claudio() : Actor() constructor {
	name_        = "Claudio";
	status_      = {
		level_    : 1,
		hp_       : 30,
		max_hp_   : 30,
		mp_       : 10,
		max_mp_   : 10,
		strength_ : 3,
		defense_  : 6,
		speed_    : 5,
		critical_ : 20,
		exp_      : 0,
		max_exp_  : 20
	}
	
	equipment_ = {
		helmet_      : noone,
		armor_       : noone,
		weapon_      : noone,
		accessory_1_ : noone,
		accessory_2_ : noone
	}
	
	actions_         = ["Attack", "Guard"];
	battle_unit_     = obj_claudio_battle_unit;
	speaker_         = [spr_claudio_portrait];
	textbox_         = spr_textbox;
	move_unit_       = obj_player;
	special_actions_ = [
		[2, "Fireball"]
	];
}

function Cassio() : Actor() constructor {
	name_        = "Cassio";
	status_      = {
		level_    : 1,
		hp_       : 35,
		max_hp_   : 35,
		mp_       : 10,
		max_mp_   : 10,
		strength_ : 3,
		defense_  : 8,
		speed_    : 7,
		critical_ : 25,
		exp_      : 0,
		max_exp_  : 20
	}
	
	equipment_ = {
		helmet_      : noone,
		armor_       : noone,
		weapon_      : noone,
		accessory_1_ : noone,
		accessory_2_ : noone
	}
	
	actions_         = ["Attack", "Guard"];
	special_actions_ = [];
	speaker_         = [spr_claudio_portrait];
	textbox_         = spr_textbox;
	battle_unit_     = obj_cassio_battle_unit;
	move_unit_       = obj_cassio;
	special_actions_ = [
		[4, "Fireball"]
	];
}
