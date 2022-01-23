/// @description  Fade
if (image_alpha != target_image_alpha_) {
    image_alpha = approach(image_alpha, target_image_alpha_, .2);
} else {
    if (image_alpha == 1) {
        target_image_alpha_ = 0;
        room_goto(next_room_);		
    } else 
        instance_destroy();
}