/// @description Target Ally
target_x_ = obj_battle.party_pos_[| index_][0];
target_y_ = obj_battle.party_pos_[| index_][1] - 50;
	
index_ += obj_input.right_pressed_ - obj_input.left_pressed_;	
index_ = clamp(index_, 0, ds_list_size(obj_battle.party_pos_) - 1);

if (x != target_x_)
	x = lerp(x, target_x_, .7);
	
if (y != target_y_)
	y = lerp(y, target_y_, .7);
        
if (obj_input.back_) {
	instance_destroy();
	obj_battle_ui.enabled_ = true;
}	

if (obj_input.action_) {
	foe_ = instance_place(target_x_, target_y_ + 50, obj_battle_unit);
	
	with (obj_battle_ui.character_index_) {
		foe_		= other.foe_;
		state_		= battle_player.use_item;
		image_index = 0;
		item_index_ = other.item_index_;
	//	state_ = other.action_.state_;		
	//	//var _script = asset_get_index(other.action_.state_);
	//	//script_execute(_script);		
	}
	instance_destroy();	
}