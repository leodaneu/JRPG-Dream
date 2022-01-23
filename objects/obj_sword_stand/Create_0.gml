event_inherited();

image_speed = 0;
image_index = 1;
//depth       = -bbox_bottom;

if (is_in_destroyed_list(id)) {
	image_index  = 0;
	activatable_ = false;
}

event_ = noone;
item_  = new Weapon();

item_.name_             = "Iron Sword";
item_.description_      = "A standard iron sword."
item_.character_        = obj_cassio_stats;
item_.status_.strength_ = 15;
item_.status_.speed_    = 10;