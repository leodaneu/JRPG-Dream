/// @description  Initialize the cutscene
action_    = 0;
last_room_ = noone;
persistent = true;

// Set all characters to the cutscene state
if (instance_exists(obj_character_parent)) {
    with (o_character_parent) {
        state_      = character.cutscene;
        image_speed = 0;
        image_index = 0;
    }
	with (obj_player) {
		state_ = player.wait;
	}
}

// Set the view's state
if (instance_exists(o_camera)) {
    with (o_camera) {
        state_ = camera_mode.view_cutscene;
    }
}
