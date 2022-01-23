depth            = -10000;
textbox_width_   = 200;
textbox_height_  = 64;
border_          = 8;
line_separation_ = 8;
line_width_      = textbox_width_ - border_ * 2;
textbox_spr_[0]  = spr_textbox;
textbox_image_   = 0;
textbox_speed_   = .1;
textbox_x_       = camera_get_view_x(view_camera[0]);
textbox_y_       = camera_get_view_y(view_camera[0]) + 112;
purple_gray_     = make_colour_rgb(145,145, 175);

page_           = 0;
page_number_    = 0;
text_[0]        = "";
//text_[0]        = "Also, for anyone who is not so inclined, like Peyton mentions, it is not necessary to make your own text. I just went Create -> Font in the Asset Browser and chose a font that I liked.";
//text_[1]        = "Bro, this is such a great thorough tutorial. deeply appreciate you!!";
//text_[2]        = "Great tutorial! Do you also a tutorial for cutscenes ? Would be everything I need for my dream tutorial";
//text_[3]        = "Can i use this for my commerical game? Amazing tutorials btw :)";
text_length_[0] = string_length(text_[0]);
char_[0, 0]     = "";
char_x_[0, 0]   = 0;
char_y_[0, 0]   = 0;
draw_char_      = 0;
text_speed_     = 1;
setup_          = false;

options_[0]         = "";
options_link_id_[0] = -1;
option_pos_         = 0;
option_number_      = 0;

sound_delay_ = 4;
sound_count_ = sound_delay_;

scr_set_defaults_for_text();
last_free_space_  = 0;
text_pause_timer_ = 0;
text_pause_time_  = 16;