/// @description Defend State

//with (obj_battle_unit) {
//    state_ = battle_player.wait;
//}
state_                               = battle_player.defend;
stats_object_.status_effect_.defend_ = true;

if (hitflash_) {
	x -= cos(timer_ * .12);
	timer_++;
} else {
	x      = xstart;
	timer_ = 0;
}


if (instance_exists(stats_object_)) {
    action_meter_ = min(action_meter_ + (stats_object_.status_.speed_ + stats_object_.status_.level_) / 10, max_action_meter_);
    
    if (action_meter_ == max_action_meter_) {
        state_                               = battle_player.action;
        obj_battle.play_                     = false;
        action_meter_                        = 0;
		stats_object_.status_effect_.defend_ = false;
    }
} else
	state_ = battle_player.wait;