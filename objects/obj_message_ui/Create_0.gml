/// @description  Initialize the message ui
event_inherited();
width_         = RESOLUTION_W;
height_        = RESOLUTION_H;
sprite_width_  = sprite_get_width(spr_textbox); // 64
sprite_height_ = sprite_get_height(spr_textbox); // 64	
cutscene_      = noone;
message_       = "";