/// @description  Set Elizabeth back to the move state
if (instance_exists(obj_player))
    obj_player.state_ = player.move;

if (instance_exists(obj_camera))
    obj_camera.state_ = camera_mode.follow_object;