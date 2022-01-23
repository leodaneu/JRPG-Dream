/// @description Hit State
image_speed = animation_speed_[state_];
var _input  = (image_index / image_number) * pi;
x           = xstart - sin(_input) * image_number * knockback_ * 3;

if (abs(x - xstart) > (image_number - 1) and stats_object_.status_.hp_ <= 0) {
	alarm[1] = global.one_second * .4;
	state_   = battle_player.death;
}

if (animation_hit_frame(image_number - 1) and stats_object_.status_.hp_ > 0) {
	state_ = battle_player.wait;	
	x      = xstart;
}