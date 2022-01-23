/// @description  Check for end of battle music
if (room == room_battle) {
	// TODO: melhorar essa gambiarra
	audio_set_next_song(world_song_, true);
	//audio_set_next_song(previous_song_, true);
    //next_song_ = previous_song_;
}

if (room == room_mini_game_level_1) {
	audio_set_next_song(previous_song_, true);
    //next_song_ = previous_song_;
}