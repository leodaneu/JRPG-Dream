function Weapon() constructor {
	name_        = "";
	description_ = "";
	skills_      = [];
	character_   = noone;
	status_      = {
		strength_ : 0,
		speed_    : 0,
	}
	status_effect_ = {
		poison_  : false,
		slow_    : false,
		burnt_   : false,
		freeze_  : false,
		confuse_ : false,
		sleep_   : false
	}
}

function Armor() constructor {
	name_        = "";
	description_ = "";
	skills_      = [];
	character_   = noone;
	status_      = {
		hp_       : 0,
		mp_       : 0,
		speed_    : 0,
	}
	protect_ = {
		poison_  : false,
		slow_    : false,
		burnt_   : false,
		freeze_  : false,
		confuse_ : false,
		sleep_   : false
	}
}

