event_inherited();
initialize_movement_entity(.5, 1, obj_solid);

// ---------- TEST ----------- //
pickup_item(obj_data.items_[? "apple"], 4);
pickup_item(obj_data.items_[? "potion"], 2);
pickup_item(obj_data.items_[? "pasta"], 1);
pickup_item(obj_data.items_[? "banana"], 3);
pickup_item(obj_data.items_[? "pizza"], 1);
pickup_item(obj_data.items_[? "chocolate"], 3);
pickup_item(obj_data.items_[? "milk"], 1);
pickup_item(obj_data.items_[? "steak"], 3);
pickup_item(obj_data.items_[? "cheese"], 1);
pickup_item(obj_data.items_[? "ham"], 3);
// --------------------------- //

// ---------- TEST ----------- //
pickup_weapon(obj_data.weapons_[? "wooden_sword"], 2);
pickup_weapon(obj_data.weapons_[? "bronze_sword"], 2);
pickup_weapon(obj_data.weapons_[? "iron_spear"], 1);

pickup_armor(obj_data.armors_[? "black_robe"], 1);
pickup_armor(obj_data.armors_[? "iron_cuirass"], 2);
pickup_armor(obj_data.armors_[? "bronze_plate"], 2);

pickup_helmet(obj_data.helmets_[? "onyx_helmet"], 2);
pickup_helmet(obj_data.helmets_[? "green_beret"], 3);
// --------------------------- //

image_speed        = 0;
acceleration_      = .5;
max_speed_         = 1.4;
direction_facing_  = dir.right;
direction_         = 0;
found_item_sprite_ = noone;
//global.player_health = 4;
party_length_      = 100;

clean_party_positions();

enum player {
	move,
	battle_encounter,
	found_item,
	wait,
	talking
}

enum dir {
	right,
	up,
	left,
	down	
}

starting_state_ = player.move;
state_          = starting_state_;

//sprite_[player.move, dir.right]             = spr_player_run_right;
sprite_[player.move, dir.right]             = spr_test_run_right;
//sprite_[player.move, dir.up]                = spr_player_run_up;
sprite_[player.move, dir.up]                = spr_test_run_up;
//sprite_[player.move, dir.left]              = spr_player_run_right;
sprite_[player.move, dir.left]              = spr_test_run_right;
//sprite_[player.move, dir.down]              = spr_player_run_down;
sprite_[player.move, dir.down]              = spr_test_run_down;

sprite_[player.found_item, dir.right]       = spr_player_found_item;
sprite_[player.found_item, dir.up]          = spr_player_found_item;
sprite_[player.found_item, dir.left]        = spr_player_found_item;
sprite_[player.found_item, dir.down]        = spr_player_found_item;

sprite_[player.battle_encounter, dir.right] = spr_player_run_right;
sprite_[player.battle_encounter, dir.up]    = spr_player_run_up;
sprite_[player.battle_encounter, dir.left]  = spr_player_run_right;
sprite_[player.battle_encounter, dir.down]  = spr_player_run_down;

sprite_[player.wait, dir.right]             = spr_test_run_right;
sprite_[player.wait, dir.up]                = spr_test_run_up;
sprite_[player.wait, dir.left]              = spr_test_run_right;
sprite_[player.wait, dir.down]              = spr_test_run_down;

sprite_[player.talking, dir.right]          = spr_test_run_right;
sprite_[player.talking, dir.up]             = spr_test_run_up;
sprite_[player.talking, dir.left]           = spr_test_run_right;
sprite_[player.talking, dir.down]           = spr_test_run_down;