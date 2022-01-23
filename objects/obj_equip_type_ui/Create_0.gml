/// @description  Initialize the Menu UI
event_inherited();
width_        = 96;
height_       = 24;
options_      = ds_list_create();

//options_[| 0] = create_option("Helmet",    menu_option_equip_helmet);
//options_[| 1] = create_option("Armor",     menu_option_equip_armor);
//options_[| 2] = create_option("Weapon",    menu_option_equip_weapon);
//options_[| 3] = create_option("Accessory", menu_option_equip_accessory);

options_[| 0] = create_option_icon(spr_icon_helmet,    menu_option_equip_helmet);
options_[| 1] = create_option_icon(spr_icon_armor,     menu_option_equip_armor);
options_[| 2] = create_option_icon(spr_icon_weapon,    menu_option_equip_weapon);
options_[| 3] = create_option_icon(spr_icon_accessory, menu_option_equip_accessory);
options_[| 4] = create_option_icon(spr_icon_accessory, menu_option_equip_accessory);

//options_[| 2] = create_option("Accessory", menu_option_equip);

for (var _i = 0; _i < ds_list_size(options_); _i++) 
    ds_list_mark_as_map(options_, _i);
	
if (ds_list_size(options_) > 0) {
    var _option = options_[| index_];
    script_execute(_option[? "script"]);
}	
	