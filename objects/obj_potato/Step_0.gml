var _vector2_x = 0;
var _vector2_y = 1;
image_xscale   = sign(velocity_[_vector2_x]);

velocity_[_vector2_x] = clamp(velocity_[_vector2_x], -max_velocity_[_vector2_x], max_velocity_[_vector2_x]);
var _on_ground        = tile_collide_at_points(tiles_, [bbox_left, bbox_bottom], [bbox_right - 1, bbox_bottom]);
	
//if ( _on_ground)
//	velocity_[_vector2_x] = lerp(velocity_[_vector2_x], 0, .2);

velocity_[_vector2_y] += gravity_;

x += velocity_[_vector2_x];

if (velocity_[_vector2_x] > 0) {
	var tile_right = tile_collide_at_points(tiles_, [bbox_right - 1, bbox_top], [bbox_right - 1, bbox_bottom - 1]);
		
	if (tile_right) {
		x = bbox_right & ~(16 - 1);
		x -= bbox_right - x;
		velocity_[@ _vector2_x] = 0;
	}
} else {
	var tile_left = tile_collide_at_points(tiles_, [bbox_left, bbox_top], [bbox_left, bbox_bottom - 1]);
	if (tile_left) {
		x = bbox_left & ~(16 - 1);
		x += 16 + x - bbox_left;
		velocity_[@ _vector2_x] = 0;
	}
}

y += velocity_[_vector2_y];

if (velocity_[_vector2_y] > 0) {
	var tile_bottom = tile_collide_at_points(tiles_, [bbox_left, bbox_bottom - 1], [bbox_right - 1, bbox_bottom - 1]);
		
	if (tile_bottom) {
		y = bbox_bottom & ~(16 - 1);
		y -= bbox_bottom - y;
		velocity_[@ _vector2_y] = 0;
	}
} else {
	var tile_top = tile_collide_at_points(tiles_, [bbox_left, bbox_top], [bbox_right - 1, bbox_top]);
		
	if (tile_top) {
		y = bbox_top & ~(16 - 1);
		y += 16 + y - bbox_top;
		velocity_[@ _vector2_y] = 0;
	}
}

//move_and_contact_tiles(tiles_, 16, velocity_);

_on_ground = tile_collide_at_points(tiles_, [bbox_left, bbox_bottom], [bbox_right - 1, bbox_bottom]);
	
if (_on_ground) {
	var _hsp         = abs(velocity_[_vector2_x]);
	var _tile_right  = tile_collide_at_points(tiles_, [bbox_right + 1, bbox_top], [bbox_right + 1, bbox_bottom - 1]);
	var _tile_left   = tile_collide_at_points(tiles_, [bbox_left - 1, bbox_top], [bbox_left - 1, bbox_bottom - 1]);
	var _tile_bottom_r = tile_collide_at_points(tiles_, [bbox_right + _hsp, bbox_bottom + 1]);
	var _tile_bottom_l = tile_collide_at_points(tiles_, [bbox_left - _hsp, bbox_bottom + 1]);
	
	if ((!_tile_right or !_tile_left) and (!_tile_bottom_r or !_tile_bottom_l))
		velocity_[_vector2_x] = -velocity_[_vector2_x];
	else if (_tile_right or _tile_left)	
		velocity_[_vector2_x] = -velocity_[_vector2_x];
	
	if (velocity_[_vector2_y] <= -(jump_speed_ / 3))
		velocity_[_vector2_y] = -jump_speed_ / 3;
}