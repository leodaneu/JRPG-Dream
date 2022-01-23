/// @description Return Position State
//var _speed      = 5;
if(pre_approach_) {
	sprite_index = sprite_[battle_player.idle];
	x            = approach(x, xstart, 1.5);
	
	if (x == xstart) {
		if (obj_battle.enemy_counter_ == 0 and alarm[2] <= 0) {
			with(obj_playable_battle_unit) 
				state_ = battle_player.victory;
		} else if (obj_battle.enemy_counter_ > 0)
			state_ = battle_player.wait;
		exit;	
	}	
} else if(alarm[1] <= 0) {
	var _x_speed = abs(foe_x_ + 16 * sign(x - foe_x_) - initial_x_) / (.6 * global.one_second);
	var _y_speed = abs(foe_y_ - initial_y_) / (.6 * global.one_second) + acceleration_;
	image_speed  = 1.5;

	x = approach(x, initial_x_ + 32, _x_speed);
	y = approach(y, initial_y_, _y_speed);

	// Move to target
	if (x == initial_x_ + 32 and y == initial_y_) {
		pre_approach_ = true;
		sprite_index  = sprite_[battle_player.idle];	
	}
}