/// @description Talking State
image_speed = 0;
image_index = 0;

//if (!instance_exists(obj_dialog) and !instance_exists(obj_shop_dialog)) 
//	state_ = player.move;
	
if (!instance_exists(obj_textbox) and !instance_exists(obj_shop_dialog))
	state_ = player.move;	