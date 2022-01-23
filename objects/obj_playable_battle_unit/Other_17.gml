/// @description Use Item State
image_speed = animation_speed_[state_];

//if (object_index != obj_playable_battle_unit) {
//    state_ = battle_player.wait;
//    exit;
//}

if (animation_hit_frame(3)) {
    obj_battle_camera.target_[? "x"] = xstart + 64 * image_xscale;
    obj_battle_camera.state_         = battle_camera_mode.battle_view_focus;
}

var _character = string_lower(foe_.stats_object_.class_.name_);

if (animation_hit_frame(5)) {
	use_item_index(item_index_, _character);
}

if (animation_hit_frame(image_number - 1)) {
    state_                   = battle_player.wait;
    obj_battle_camera.state_ = battle_camera_mode.battle_view_idle;
	image_index              = 0;
}