/// @description  Destroy the child
if (instance_exists(child_)) {
    with (child_) instance_destroy();
}

if (instance_exists(parent_)) {
    //parent_.enabled_ = true;
    parent_.child_   = noone;
    parent_.visible  = true;
	parent_.alarm[0] = global.one_second / 20;
}

if (instance_number(obj_ui_parent) == 1 /*and !instance_exists(obj_cutscene_parent)*/) {
    if (instance_exists(obj_player)) {
		obj_player.alarm[0] = global.one_second / 20;
        //obj_player.state_   = player.move;
	}
}	
 