/// @description Talk State
obj_player.state_ = player.talking;

//if (!ds_map_exists(obj_event_manager.event_map_, event.allow_cassio_party)) {
if (join_party_) {
	fire_event(event.cassio_party);
	
	text_id_ = "join_party_cassio";
	
	scene_info_ = [
	    [cutscene_fade_transition],
		[cutscene_wait, 1],
		[cutscene_fade_screen, leading.out],
		[cutscene_wait, 1.5],
		[cutscene_dialog, text_id_],
		[cutscene_wait_press],
		[cutscene_change_direction, obj_player, 0, 1],
		[cutscene_clean_party_positions],
		[cutscene_wait, .5],
		[cutscene_fade_screen, leading.in]
	];
	
	create_cutscene(scene_info_);
	instance_destroy(inst_cassio_box);
	//create_message_at_view_center("Cassio has joined your party!!!");	
} else {
	create_textbox(text_id_);
}