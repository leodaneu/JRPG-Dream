function audio_set_next_song(next_song, fade) {
	 if (instance_exists(obj_audio_player)) {
		obj_audio_player.fade_      = fade;
		obj_audio_player.next_song_ = next_song;
	 }
}