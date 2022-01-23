/// @description  Update the draw health

with (stats_object_) {
    var _dis = draw_health_ - status_.hp_;
    if (_dis > 1) 
        draw_health_ = lerp(draw_health_, status_.hp_, .1);
    else 
        draw_health_ = status_.hp_;   
}
