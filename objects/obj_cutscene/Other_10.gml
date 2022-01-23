current_scene_    = scene_info_[scene_];
var _array_length = array_length(current_scene_) - 1;

current_scene_array_ = -1;
current_scene_array_ = array_create(_array_length, 0);
array_copy(current_scene_array_, 0, current_scene_, 1, _array_length);

//if (scene_ == array_length(scene_info_) - 1) {
if (scene_ == array_length(scene_info_) - 1) {
	obj_player.state_ = player.move;
}	
