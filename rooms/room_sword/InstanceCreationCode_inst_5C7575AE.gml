trigger_scene_info_ = [
	[cutscene_move_character, obj_player, 104, 136, false, 1],
	[cutscene_create_animation, spr_explosion_effect, 104, 136, random_range(.4, .8), true, aud_explosion, 4, false],
	[cutscene_change_visibility, obj_player, false],
	[cutscene_move_character, obj_player, 232, 104, false, 2],
	[cutscene_wait, .5],
	[cutscene_create_animation, spr_explosion_effect, 232, 104, random_range(.4, .8), true, aud_explosion, 4, false],
	[cutscene_change_visibility, obj_player, true],
	[cutscene_wait, .5],
	[cutscene_move_character, obj_player, -16, 0, true, 1]
];