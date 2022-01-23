create_animation_effect(spr_enemy_death, x, y - 8, .6, true);
audio_play_sound(aud_hit, 3, false);

//if (chance(.75)) {
//	var _item = choose(o_gem_pickup, o_heart_pickup);	
//	instance_create_layer(x, y - 8, "Instances", _item);
//}