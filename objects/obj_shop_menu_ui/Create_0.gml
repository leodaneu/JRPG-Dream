/// @description  Initialize the shop menu ui
event_inherited();
height_ = 64;

var _option_index           = 0;
options_                    = ds_list_create();
options_[| _option_index++] = create_option("Buy",   menu_option_items);
options_[| _option_index++] = create_option("Sell",  menu_option_items);
//options_[| _option_index++] = create_option("Equip", menu_option_equip);
options_[| _option_index++] = create_option("Exit",  menu_option_exit);

for (var _i = 0; _i < ds_list_size(options_); _i++)
    ds_list_mark_as_map(options_, _i);