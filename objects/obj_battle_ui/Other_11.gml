 /// @description Item State
enabled_       = false;
var _item_list = instance_create_layer(bbox_left + 13, target_y_ - sprite_height / 2, "Instances", obj_item_list_ui);
_item_list.y -= _item_list.height_ + 4;
_item_list.parent_ = id;
_item_list.caller_ = character_index_;
