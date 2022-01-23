init_data();
gold_         = 0;
party_        = ds_map_create();
actions_      = ds_map_create();
enemy_battle_ = ds_map_create();
party_order_  = ds_list_create();

// The first member of the party must be the main character
ds_list_add(party_order_, "Claudio");
ds_map_add(party_, "Claudio", global.party[party.claudio]);

ds_map_add(actions_, "Attack", global.actions[actions.attack]);
ds_map_add(actions_, "Guard", global.actions[actions.guard]);

last_room_ = noone;

global.inventory          = ds_list_create();
global.inventory_amount   = ds_list_create();
global.helmets            = ds_list_create();
global.helmets_amount     = ds_list_create();
global.armors             = ds_list_create();
global.armors_amount      = ds_list_create();
global.weapons            = ds_list_create();
global.weapons_amount     = ds_list_create();
global.accessories        = ds_list_create();
global.accessories_amount = ds_list_create();

global.one_second            = game_get_speed(gamespeed_fps);
global.player_start_position = inst_game_start; 
global.destroyed             = [];
global.start_x               = noone;
global.start_y               = noone;

//surface_resize(application_surface, view_wport[0] * 4,view_hport[0] * 4);
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
instance_create_layer(0, 0, "Instances", obj_input);
instance_create_layer(10, 10, "Instances", obj_data);

paused_          = false;
var _font_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ.abcdefghijklmnopqrstuvwxyz1234567890>,!':-+";
var _font_str    = "ABCDEFGHIJKLMNOPQRSTUVXWYZabcdefghijklmnopqrstuvxwyz1234567890>,!:-+$/=%'#@&_(),.;:?!\|{}<>[]`^~ÀÁÂÃÇÈÉÊÌÍÑÒÓÔÕÙÚÛàáâãçèéêìíñòóôõùúû";
// global.font      = font_add_sprite_ext(spr_font, _font_string, true, 1);
global.font      = font_add_sprite_ext(spr_font_2, _font_str, true, .8);

draw_set_font(global.font);

//audio_play_sound(aud_world, 10, true);