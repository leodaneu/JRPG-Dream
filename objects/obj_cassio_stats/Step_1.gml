/// @description  Update the draw health

var _distance = draw_health_ - status_.hp_;

if (_distance > 1)
    draw_health_ = lerp(draw_health_, status_.hp_, .1);
else 
    draw_health_ = status_.hp_;