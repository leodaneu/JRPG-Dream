/// @description  Create the battle enemy
event_inherited();
//init_battle_unit(choose(/*"werewolf",*/ "gargoyle", "spider"), true, .6, .8, .5, .6);
init_battle_unit(obj_game.enemy_battle_, true, 1, 1, 1, 1);
knockback_ = -1;