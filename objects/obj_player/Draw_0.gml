draw_sprite(spr_shadow, 0, x, y);
draw_self();

if (sprite_exists(found_item_sprite_))
	draw_sprite(found_item_sprite_, 0, x, y - 32);