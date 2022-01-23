/// @description  Navigate the options
if (!enabled_)
	exit;
	
index_ += obj_input.down_pressed_ - obj_input.up_pressed_;
index_ = clamp(index_, 0, ds_list_size(options_) - 1);

if (obj_input.back_) {
	//ds_list_destroy(options_);
	//instance_destroy(id, false);
	instance_destroy();
}

if (obj_input.action_ and ds_list_size(options_) > 0) {
    var _option = options_[| index_];
    script_execute_alt(_option[? "script"], [_option[? "arg_1"], _option[? "arg_2"]]);
}