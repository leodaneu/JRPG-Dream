/// @description  Initialize the Yes/No UI
event_inherited();
width_  = 32;
height_ = 28;

options_      = ds_list_create();
//options_[| 0] = create_option("Yes", item_option_use);
//options_[| 1] = create_option("No", item_option_use);
options_[| 0] = create_option("Yes", go_to_minigame);
options_[| 1] = create_option("No", instance_destroy);

for (var _i = 0; _i < ds_list_size(options_); _i++) {
    ds_list_mark_as_map(options_, _i);
}