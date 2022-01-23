/// @description Battle Camera Idle State
target_[? "x"] = 480;
target_[? "y"] = 90;

x = clamp(x, width_ / 2, room_width - width_ / 2);
y = clamp(y, height_ / 2, room_height - height_ / 2);

view_approach(x, y, 320, 180, .05, .1);