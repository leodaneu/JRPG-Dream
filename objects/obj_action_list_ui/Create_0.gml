/// @description  Initialize the menu ui
event_inherited();
width_   = 64;
height_  = 32;
options_ = ds_list_create();

var _action_list = obj_battle_ui.character_index_.stats_object_.class_.actions_; 
var _list_size   = array_length(obj_battle_ui.character_index_.stats_object_.class_.actions_);

for (var _i = 0; _i < _list_size; _i++)
    options_[| _i] = create_option(_action_list[_i], action_option_use_ui);

for (var _i = 0; _i < ds_list_size(options_); _i++) {
    ds_list_mark_as_map(options_, _i);
} 