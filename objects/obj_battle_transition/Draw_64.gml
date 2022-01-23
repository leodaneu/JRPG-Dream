/// @description  Draw the flash

// Set the blend mode
gpu_set_blendmode(bm_normal);

// Draw orange flash
draw_set_colour(c_orange);
draw_set_alpha(orange_alpha_);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Draw white flash
draw_set_colour(c_white);
draw_set_alpha(white_alpha_);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Set back to normal drawing
draw_set_colour(c_white)
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
