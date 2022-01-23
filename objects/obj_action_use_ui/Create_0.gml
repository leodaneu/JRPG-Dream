/// @description  Initialize the menu UI
event_inherited();
width_  = 48;
height_ = 32;

options_      = ds_list_create();
options_[| 0] = create_option("Use", action_option_use);
options_[| 1] = create_option("Info", action_option_info);

for (var _i = 0; _i < ds_list_size(options_); _i++) 
    ds_list_mark_as_map(options_, _i);