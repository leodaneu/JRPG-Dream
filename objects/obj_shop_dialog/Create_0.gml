/// @description  Initialize the dialog object
text_         = noone;
text_visible_ = "";
text_page_    = 0;
text_count_   = 0;
cutscene_     = noone;
// width_        = 128;
spd_          = .5;

//////////////////////////////
x1_            = RESOLUTION_W / 2;
y1_            = RESOLUTION_H - 70;
x2_            = RESOLUTION_W / 2;
y2_            = RESOLUTION_H;
x1_target_     = 0;
x2_target_     = RESOLUTION_W;
lerp_progress_ = 0;
text_progress_ = 0;
width_         = RESOLUTION_W;
height_        = RESOLUTION_H / 3;
sprite_width_  = sprite_get_width(spr_textbox); // 64
sprite_height_ = sprite_get_height(spr_textbox); // 64	
/////////////////////////////////

//width_        = sprite_width;
margin_       = 4;
portrait_     = spr_default_portrait;
portrait_x1_  = display_get_gui_width() - sprite_get_width(portrait_) - 3;
portrait_y1_  = display_get_gui_height() - sprite_get_height(portrait_) - 4;
portrait_x2_  = (sprite_get_width(portrait_) + 8) / sprite_width_;
portrait_y2_  = (height_ + 12) / sprite_height_
enabled_      = true;

textbox_x1_ = x;
textbox_x2_ = (portrait_x1_ - x - 4) / sprite_width_;
textbox_y1_ = (2 / 3) * RESOLUTION_H;
textbox_y2_ = height_ / sprite_height_;

// Position
pos_x_ = 42;
pos_y_ = (display_get_gui_height() - sprite_height) - 4;

// Create the audio emitter
emitter_     = audio_emitter_create();
//voice_       = aud_voice;
voice_pitch_ = 1;