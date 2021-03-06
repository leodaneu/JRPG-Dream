
if (instance_exists(global.player_start_position)) {
	if (instance_exists(obj_player)) {
		obj_player.persistent = false;
		obj_player.x          = global.player_start_position.x;
		obj_player.y          = global.player_start_position.y;
		obj_player.layer      = layer_get_id("Instances");
		
		with(obj_follower_parent)
			persistent = false;
			
	} else {
		var _start_x = global.player_start_position.x;
		var _start_y = global.player_start_position.y;
		instance_create_layer(_start_x, _start_y, "Instances", obj_player);
	}
	global.player_start_position = noone;
}


