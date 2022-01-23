event_inherited();
if (!instance_exists(obj_player)) {
	exit;
}

image_index = 0;
var _item = obj_data.weapons_[? "iron_sword"];
pickup_weapon(_item, 1);
// inventory_add_item(obj_sword_item);
set_player_found_item(spr_sword_item, _item);


if (instance_exists(obj_event_manager)) {
	obj_event_manager.event_ = event_;
	obj_event_manager.room_  = room_world;
}

activatable_ = false;
add_to_destroyed_list(id);