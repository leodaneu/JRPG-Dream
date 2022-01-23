/// @description  Destroy the options
event_inherited();
ds_list_destroy(options_);
audio_play_sound(aud_menu_select, 2, false);

with(parent_)
	instance_destroy();