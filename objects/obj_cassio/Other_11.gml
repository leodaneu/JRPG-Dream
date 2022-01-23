/// @description Follow State
switch(obj_player.record_sprite_[record_]) {
	//case spr_player_run_right:
	case spr_test_run_right:
		sprite_index = spr_cassio_run_right;
		image_xscale = obj_player.record_xscale_[record_];
		break;
	//case spr_player_run_down:
	case spr_test_run_down:
		sprite_index = spr_cassio_run_down;
		image_xscale = 1;
		break;
	//case spr_player_run_up:
	case spr_test_run_up:
		sprite_index = spr_cassio_run_up;
		image_xscale = 1;
		break;
}

x           = obj_player.pos_x_[record_];
y           = obj_player.pos_y_[record_];
image_speed = obj_player.image_speed;

if (image_speed == 0) 
	image_index = 0;