/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var _unit_ui   = instance_create_layer(xstart - 40, ystart - 24, "Instances", obj_battle_unit_ui);
_unit_ui.unit_ = id;
_unit_ui.x -= _unit_ui.sprite_width / 2;

knockback_        = 1;
acceleration_     = .3;
timer_            = 0;
y_approach_speed_ = 0;
approach_gravity_ = 15 / global.one_second;