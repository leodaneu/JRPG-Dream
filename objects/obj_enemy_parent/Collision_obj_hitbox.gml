// health_ -= other.damage_;

if (other.type_ == hitbox_type.kick) {
	state_                   = enemy.hit;
	var _knockback_direction = point_direction(other.x, other.y, x, y);
	set_movement(_knockback_direction, other.knockback_)
}

if (other.type_ == hitbox_type.punch) {
	// Battle mode
}