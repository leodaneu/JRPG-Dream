// Draw the health bar
if (!instance_exists(unit_)) {
    instance_destroy();
    exit;
}

draw_self();
draw_bar(x + 3, y + 4, spr_health_bar,  unit_.stats_object_.status_.hp_, unit_.stats_object_.status_.max_hp_);

if (is_in_array(unit_.state_, [battle_player.idle, battle_player.hit, battle_player.wait, battle_player.run, battle_player.use_item, battle_player.defend])) {
    draw_bar(x + 3, y + 8, spr_action_meter,  unit_.action_meter_, unit_.max_action_meter_);
} else { 
    draw_bar(x + 3, y + 8, spr_action_meter,  unit_.max_action_meter_, unit_.max_action_meter_);
}

//draw_text(x + 3, y + 15, string_hash_to_newline("Level"));
//draw_set_halign(fa_right);
//draw_text(x + sprite_width - 14, y + 15, string_hash_to_newline(string(unit_.stats_object_.status_.level_)));
draw_text(x + 3, y + 14, string_hash_to_newline(string(unit_.stats_object_.class_.name_)));
draw_set_halign(fa_left);