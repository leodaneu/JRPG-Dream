/// @description  Manage the text to be drawn on screen
get_visible_text(room_speed / 3);
if (!enabled_) exit;
	
if (obj_input.action_ and !instance_exists(obj_shop_menu_ui)) {
	var _text_length = string_length(text_[text_page_]);
    
	if (text_count_ >= _text_length) {
		text_page_++;
	    text_count_   = 0;
		text_visible_ = "";
		
	    if (text_page_ > array_length(text_) - 1) {
	        if (cutscene_ != noone)
	            cutscene_.action_++;
            
	        instance_destroy();
	    }
	} else {
	    text_count_ = _text_length;
	    //audio_play_sound_on(emitter_, voice_, false, 10);
	}
}

if (text_page_ == 0 and text_count_ == string_length(text_[text_page_])) {
	if (!instance_exists(obj_shop_menu_ui)) {		
		instance_create_layer(16, 16, "Instances", obj_shop_menu_ui);
		exit;
	}
}
	