/// @description  Set the facing diretion
event_inherited();
image_speed       = .3;
dialog_object_    = obj_dialog;
direction_facing_ = dir.down;
portrait_         = spr_adam_portrait;

sprite_[player.move, dir.right] = spr_player_run_right;
sprite_[player.move, dir.up]    = spr_player_run_up;
sprite_[player.move, dir.left]  = spr_player_run_right;
sprite_[player.move, dir.down]  = spr_player_run_down;

var _i      = 0;
text_[_i++] = "SHEEEEY!!! Seja ecletico!!";
text_[_i++] = "How are you, man?";
text_[_i++] = "PEI! PEI! PEI!!!! SHUBAR....";

/*
sprite_[RIGHT] = s_elizabeth_right;
sprite_[UP] = s_elizabeth_up;
sprite_[LEFT] = s_elizabeth_left;
sprite_[DOWN] = s_adam_down;
*/
//state_ = character_cutscene_state;