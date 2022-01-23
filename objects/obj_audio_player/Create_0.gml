/// @description  Initialize the music player
fade_       = true;
fade_speed_ = .02;

music_emitter_    = audio_emitter_create();
music_volume_     = .5;
music_max_volume_ = .8;

sfx_emitter_    = audio_emitter_create();
sfx_volume_     = .5;
sfx_max_volume_ = 1;

previous_song_ = noone;
current_song_  = noone;
next_song_     = aud_world;
world_song_    = aud_world;