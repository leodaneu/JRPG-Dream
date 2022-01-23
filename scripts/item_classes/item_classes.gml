function Equipment() constructor {
	name_      = "";
	actions_   = [];
	character_ = noone;
	status_ = {}
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