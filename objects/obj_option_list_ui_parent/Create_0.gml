/// @description  Initialize the options list ui
event_inherited();
index_          = 0;
width_          = 72;
height_         = 64;
sprite_width_   = sprite_get_width(spr_textbox); // 64
sprite_height_  = sprite_get_height(spr_textbox); // 64
options_        = ds_list_create();

for (var _i = 0; _i < ds_list_size(options_); _i++)
    ds_list_mark_as_map(options_, _i);

if (instance_exists(obj_player)) {
    obj_player.state_ = player.wait;
}

purple_gray_ = make_colour_rgb(145,145, 175);