trigger_scene_info_ = [
    [cutscene_fade_transition],
	[cutscene_wait, 1],
	[cutscene_fade_screen, leading.out],
	//[cutscene_view_approach, 95, 72, 288, 162, 0.5, .05],
	[cutscene_wait, 1.5],
	[cutscene_move_character, obj_player, 95, 72, false, 1],
	[cutscene_create_animation, spr_explosion_effect, 95, 72, random_range(.4, .8), true],
	[cutscene_wait, 1],
	//[cutscene_dialog],
	[cutscene_fade_screen, leading.in]
	//[cutscene_move_character, obj_player, 104, 136, false, 1],
	//[cutscene_create_animation, spr_explosion_effect, 104, 136, random_range(.4, .8), true],
	//[cutscene_change_visibility, obj_player, false],
	//[cutscene_move_character, obj_player, 232, 104, false, 2],
	//[cutscene_wait, .5],
	//[cutscene_create_animation, spr_explosion_effect, 232, 104, random_range(.4, .8), true],
	//[cutscene_change_visibility, obj_player, true],
	//[cutscene_wait, .5],
	//[cutscene_move_character, obj_player, -16, 0, true, 1]
];