trigger_scene_info_ = [
	[cutscene_move_character, obj_player, 232, 104, false, 1],
	//[cutscene_instance_create, 232, 104, "Instances", obj_grass_effect],
	[cutscene_create_animation, spr_explosion_effect, 232, 104, .7, true, aud_explosion, 4, false],
	[cutscene_change_visibility, obj_player, false],
	[cutscene_move_character, obj_player, 104, 136, false, 2],
	//[cutscene_instance_destroy, obj_player],
	[cutscene_wait, .5],
	//[cutscene_instance_create, 104, 136, "Instances", obj_grass_effect],
	[cutscene_create_animation, spr_explosion_effect, 104, 136, .7, true, aud_explosion, 4, false],
	[cutscene_change_visibility, obj_player, true],
	//[cutscene_instance_create, 104, 136, "Instances", obj_player],
	[cutscene_wait, .5],
	[cutscene_move_character, obj_player, -16, 0, true, 1]
];