/// @description  Initialize the battle unit
BATTLE_SPACE      = 220;//160;
hitflash_         = false;
action_meter_     = 0;
max_action_meter_ = 100;
item_index_       = 0;
state_            = battle_player.idle;
foe_              = noone;
initial_x_        = x;
initial_y_        = y;
stats_object_     = noone;
has_won_          = false;
damage_           = 0;

//var _unit_ui   = instance_create_layer(xstart, 16, "Instances", obj_battle_unit_ui);

//_unit_ui.unit_ = id;
//_unit_ui.x -= _unit_ui.sprite_width / 2;

enum battle_player {
	idle,
	wait,
	action,
	approaching,
	return_position,
	attack,
	ranged_attack,
	use_item,
	hit,
	defend,
	death,
	victory,
	run
}
