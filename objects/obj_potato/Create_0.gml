event_inherited();

acceleration_     = .3;
max_speed_        = .7;
gravity_          = .12;
x_speed_          = 0;
y_speed_          = 0;
jump_speed_       = 3;
jump_height_      = -8;
//move_speed_       = 1.8;
direction_facing_ = dir.right;
direction_        = 0;
tiles_            = layer_tilemap_get_id(layer_get_id("Tiles_1"));


velocity_     = [.5, 0];
max_velocity_ = [1, 2];