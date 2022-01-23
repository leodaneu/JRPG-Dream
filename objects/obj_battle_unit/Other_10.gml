/// @description Idle State
stats_object_.status_effect_.defend_ = false;
depth       = 0;
image_speed = animation_speed_[state_];

// Check to see if the battle timeline is running
if (obj_battle.play_ and instance_exists(stats_object_)) {
	
    action_meter_ = min(action_meter_ + (stats_object_.status_.speed_ + stats_object_.status_.level_) / 10, max_action_meter_);
    
    if (action_meter_ == max_action_meter_) {
        state_           = battle_player.action;
        obj_battle.play_ = false;
        action_meter_    = 0;
        //stats_object_.status_effect_[status.defend] = false;
    }
} else
	state_ = battle_player.wait;