/// @description  Initialize the menu ui
event_inherited();
width_  = 60
height_ = 66;

var _option_index           = 0;
options_                    = ds_list_create();
options_[| _option_index++] = create_option("Status", menu_option_status);
options_[| _option_index++] = create_option("Items",  menu_option_items);
options_[| _option_index++] = create_option("Equip",  menu_option_party_equip);
options_[| _option_index++] = create_option("Save",   menu_option_save);
options_[| _option_index++] = create_option("Load",   menu_option_load);
options_[| _option_index++] = create_option("Exit",   menu_option_exit);

for (var _i = 0; _i < ds_list_size(options_); _i++)
    ds_list_mark_as_map(options_, _i);
	
if (instance_exists(obj_enemy_parent))
	with(obj_enemy_parent) 
		state_ = enemy.wait;