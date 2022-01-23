draw_set_color(c_black);
draw_rectangle(0, 0, width_, percent_ * limiter_, false);
draw_rectangle(0, height_, width_, height_ - (percent_ * limiter_), false);