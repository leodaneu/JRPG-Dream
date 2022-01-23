/// @description  Play the song
if (audio_exists(next_song_)) {
    if (music_volume_ > 0) {
        if (fade_) 
            music_volume_ = approach(music_volume_, 0, fade_speed_);
        else 
            music_volume_ = 0;
    } else {
        previous_song_ = current_song_;
        current_song_  = next_song_;
        next_song_     = noone;
        
        if (audio_exists(previous_song_)) {
            audio_stop_sound(previous_song_);
        }
    }
} else {
    if (fade_)
        music_volume_ = approach(music_volume_, music_max_volume_, fade_speed_);
     else 
        music_volume_ = music_max_volume_;
}

if (!audio_is_playing(current_song_) and audio_exists(current_song_)) {
	audio_play_sound_on(music_emitter_, current_song_, true, 10);
	//audio_play_sound(current_song_, 4, true);
}

audio_emitter_gain(sfx_emitter_, sfx_volume_);
audio_emitter_gain(music_emitter_, music_volume_);