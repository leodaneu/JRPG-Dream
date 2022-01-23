if (!instance_exists(obj_cutscene)){
	if (place_meeting(x, y, obj_player)) {
		obj_player.state_ = player.wait;
		create_cutscene(trigger_scene_info_);
	}
}