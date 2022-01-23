/// @description  Navigate the options
if (!enabled_) 
	exit;

show_debug_message("step: " + string(ds_list_size(options_)));
if (obj_input.down_pressed_ - obj_input.up_pressed_ != 0)
	audio_play_sound(aud_menu_move, 2, false);
	
index_ += obj_input.down_pressed_ - obj_input.up_pressed_;
index_ = clamp(index_, 0, ds_list_size(options_) - 1);

if (obj_input.back_)
    instance_destroy();

if (obj_input.action_ and ds_list_size(options_) > 0) {
    var _option = options_[| index_];
    script_execute_alt(_option[? "script"], [_option[? "arg_1"], _option[? "arg_2"]]);
}
