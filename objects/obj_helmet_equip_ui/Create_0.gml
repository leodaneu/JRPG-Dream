/// @description  Initialize the Menu UI
event_inherited();

width_        = 48;
height_       = 32;
options_      = ds_list_create();
options_[| 0] = create_option("Equip", helmet_option_equip);
options_[| 1] = create_option("Info",  helmet_option_info);
//options_[| 2] = create_option("Drop",  item_option_drop);

for (var _i = 0; _i < ds_list_size(options_); _i++) 
    ds_list_mark_as_map(options_, _i);