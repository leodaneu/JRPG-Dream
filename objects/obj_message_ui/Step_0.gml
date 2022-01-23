/// @description  Close the message
if (child_ == noone) {
	if (obj_input.action_ or obj_input.back_ or alarm[0] == 0) {
	    // Don't let the input propagate
	    obj_input.action_ = false;
	    obj_input.back_   = false;
	    // if (cutscene_) cutscene_.action_++;
	    instance_destroy();
	}
}
