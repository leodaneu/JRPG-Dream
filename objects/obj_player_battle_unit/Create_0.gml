/// @description  Create the player battle object
event_inherited();
stats_object_ = obj_player_stats;
id.level_     = stats_object_.level_;
init_battle_unit("elizabeth", false, .8, .8, .7, .7);