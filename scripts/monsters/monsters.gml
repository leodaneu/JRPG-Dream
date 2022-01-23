/*
global.Bat = {
	name_ : "Bat",
	
	status_ : {
		level_    : 1,
		hp_       : 4,
		max_hp_   : 4,
		mp_       : 0,
		max_mp_   : 0,
		strength_ : 1,
		defense_  : 2,
		speed_    : 3
	},
		
	drop_exp_  : 5,
	drop_gold_ : 5,
	drop_item_ : noone
}
*/
function Bat() : Enemy() constructor {
	create = function() {
		return new Bat();
	}
	
	name_    = "Bat";
	actions_ = ["Attack", "Guard"];
	
	status_ = {
		level_    : 1,
		hp_       : 4,
		max_hp_   : 4,
		mp_       : 0,
		max_mp_   : 0, 
		strength_ : 1,
		defense_  : 2,
		speed_    : 3,
		critical_ : 5
	}
		
	drop_exp_  = 5;
	drop_gold_ = 5;
	drop_item_ = noone;
}