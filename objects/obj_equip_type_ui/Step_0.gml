/// @description  Navigate the options
if (!enabled_)
	exit;

//var _input_value = obj_input.right_pressed_ - obj_input.left_pressed_;

//if (index_ != index_ + _input_value) {
//	var _option = options_[| index_];
//	script_execute(_option[? "script"]);
//}
if (obj_input.right_pressed_ - obj_input.left_pressed_ != 0)
	audio_play_sound(aud_menu_move, 2, false);

index_ += obj_input.right_pressed_ - obj_input.left_pressed_;
index_ = clamp(index_, 0, ds_list_size(options_) - 1);

if (obj_input.back_) {
	instance_destroy();
}	

//if (obj_input.action_ and ds_list_size(options_) > 0) {
//    var _option = options_[| index_];
//    script_execute(_option[? "script"]);
//}

//if (obj_input.right_pressed_ - obj_input.left_pressed_ != 0 and ds_list_size(options_) > 0) {
//	var _option = options_[| index_];
//	script_execute(_option[? "script"]);
//}
