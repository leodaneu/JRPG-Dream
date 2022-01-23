/// @description  Initialize the battle object
// Waiting is used to make sure we don't end a turn too early
play_          = true;
has_won_       = false;
alarm[0]       = 1;
enemy_counter_ = 0;
total_exp_     = 0;
parent_        = noone;

enemies_pos_   = ds_list_create();
party_pos_     = ds_list_create();
enemies_       = [];
party_members_ = [];

var _key        = ds_map_find_first(obj_game.party_);
var _party_size = ds_map_size(obj_game.party_);

party_members_[0] = _key;
for (var _i = 1; _i < _party_size; _i++) {
	_key = ds_map_find_next(obj_game.party_, _key);
	party_members_[_i] = _key; 
}