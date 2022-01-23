/// @description  Initialize the player stats
event_inherited();

//status_effect_[status.defend] = false;
class_         = obj_game.party_[? "Cassio"];
equipment_     = class_.equipment_;
status_        = class_.status_;
status_effect_ = class_.status_effect_;
draw_health_   = status_.hp_;

actions_         = ds_list_create();
special_actions_ = ds_list_create();

ds_list_add(actions_, obj_game.actions_[? "Attack"]);
ds_list_add(actions_, obj_game.actions_[? "Guard"]);
/*actions_[| _i++] = obj_game.actions_[? "Attack"];
actions_[| _i++] = obj_game.actions_[? "Guard"];
*/
// New action list
// action_level_[2] = obj_data.actions_[? "fireball"];