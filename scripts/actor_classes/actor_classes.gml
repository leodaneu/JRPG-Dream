
function Actor() constructor {
	name_        = "";
	actions_     = [];
	battle_unit_ = noone;
	status_ = {
		level_    : 1,
		hp_       : 0,
		max_hp_   : 0,
		mp_       : 0,
		max_mp_   : 0,
		strength_ : 0,
		defense_  : 0,
		speed_    : 0,
	}
	status_effect_ = {
		defend_  : false,
		poison_  : false,
		slow_    : false,
		burnt_   : false,
		freeze_  : false,
		confuse_ : false,
		sleep_   : false
	}
}

function Enemy(name) : Actor() constructor {
	name_ = name;
	drop_ = {
		drop_exp_  : 0,
		drop_gold_ : 0,
		drop_item_ : noone
	}
	status_  = {
		level_    : 1,
		hp_       : 0,
		max_hp_   : 0,
		mp_       : 0,
		max_mp_   : 0,
		strength_ : 0,
		defense_  : 0,
		speed_    : 0
	}
}

function SpecialEnemy(): Enemy() constructor {
	ability_ = noone;
}