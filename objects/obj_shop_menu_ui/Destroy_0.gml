event_inherited();
ds_list_destroy(options_);

if (instance_exists(obj_shop_dialog)) {
	obj_player.state_ = player.talking;
}

//if (instance_number(obj_ui_parent) == 1 /*and !instance_exists(obj_cutscene_parent)*/)
//    if (instance_exists(obj_player)) 
//        obj_player.state_ = player.move;