/// @description  Activate the speaker object
if (!instance_exists(dialog_)) {
    dialog_ = instance_create_layer(0, 0, "Instances", dialog_object_);
        
    if (dialog_.object_index == obj_dialog) {
        dialog_.text_        = text_;
        dialog_.portrait_    = portrait_;
        dialog_.voice_pitch_ = voice_pitch_;
                
        with (dialog_) {
			event_user(0); // format text
		} 			
		
        other.state_ = player.talking;
    }
}