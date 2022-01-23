if (image_alpha != target_image_alpha_)
    image_alpha = approach(image_alpha, target_image_alpha_, .02);
else {
    if (image_alpha == 1) 
        target_image_alpha_ = 0;	
    else 
        instance_destroy();
}