if (instance_exists(obj_minigame_player)) {
	for (var _i = 0; _i < obj_minigame_player.max_health_; _i++) {
		var _filled = _i < obj_minigame_player.health_;
		draw_sprite(spr_heart, _filled, 10 + 15 * _i, 10);
	}
}