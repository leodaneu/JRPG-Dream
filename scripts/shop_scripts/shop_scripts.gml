function create_shop_items_option_list() {
	var _options = ds_list_create();

	//for (var _i = 0; _i < ds_list_size(obj_stats.items_); _i++) {
	for (var _i = 0; _i < ds_list_size(shop_inventory_); _i++) {
	    var _item        = shop_inventory_.item_[| _i];
	    //var _item_number = shop_inventory_.item_number_[| _i];
	    var _option_text = /*"x" + string(_item_number) + " " +*/_item.name_;
		
	    //if (_item_number > 1) _option_text += "s";
    
	    if (string_length(_option_text) > 13) {
	        _option_text = string_copy(_option_text, 0, 10);
	        _option_text += "...";
	    }
    
	    _options[| _i] = create_option(_option_text, item_option_buy_ui);
	}

	for (var _j = 0; _j < ds_list_size(_options); _j++)
	    ds_list_mark_as_map(_options, _j);

	return _options;
}

function item_option_buy_ui() {
	child_         = instance_create_layer(x + width_ + 4, y, "Instances", obj_item_use_ui);
	child_.parent_ = id;
	enabled_       = false;
}

function item_option_buy() {
	if (instance_exists(parent_)) {
	    with (parent_) {
	        if (instance_exists(obj_playable_battle_unit)) {
	            o_player_battle_unit.state_      = battle_player.use_item;
	            o_player_battle_unit.item_index_ = index_;
	            instance_destroy();
	        } else {
	            use_item_index(index_);
	            if (instance_exists(obj_menu_ui)) 
	                with (obj_menu_ui) instance_destroy();
	        }
	    }
	}
}