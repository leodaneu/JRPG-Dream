/// @description  Approach the target alpha
if (white_alpha_ > target_white_alpha_ or orange_alpha_ > target_orange_alpha_) {
    
    white_alpha_  = lerp(white_alpha_, target_white_alpha_, .2);
    orange_alpha_ = lerp(orange_alpha_, target_orange_alpha_, .075);
} else {
    
    white_alpha_  = lerp(white_alpha_, target_white_alpha_, .2);
    orange_alpha_ = lerp(orange_alpha_, target_orange_alpha_, .2);
}

// Go to the minigame room if the white fade is almost complete
if (room != room_mini_game_level_1) {
    if (point_distance(white_alpha_, 0, target_white_alpha_, 0) <= .2) {
        room_persistent = true;
        room_goto(room_mini_game_level_1);
        obj_game.last_room_ = room;	
    }
} else {
    // Destroy the transition when finished
    if (point_distance(white_alpha_, 0, target_white_alpha_, 0) <= .01) {
        instance_destroy();
    }
}