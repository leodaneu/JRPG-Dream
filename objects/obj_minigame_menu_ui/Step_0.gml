/// @description  Navigate the options
if (!enabled_)
	exit;
	
index_ += obj_minigame_input.down_pressed_ - obj_minigame_input.up_pressed_;
index_ = clamp(index_, 0, ds_list_size(options_) - 1);

if (obj_minigame_input.back_) 
	instance_destroy();

if (obj_minigame_input.action_ and ds_list_size(options_) > 0) {
    var _option = options_[| index_];
    script_execute(_option[? "script"]);
}