ds_map_destroy(party_);
ds_map_destroy(actions_);
ds_map_destroy(enemy_battle_);

ds_list_destroy(party_order_);
ds_list_destroy(global.inventory);
ds_list_destroy(global.inventory_amount);
ds_list_destroy(global.weapons);
ds_list_destroy(global.weapons_amount);
ds_list_destroy(global.helmets);
ds_list_destroy(global.helmets_amount);
ds_list_destroy(global.armors);
ds_list_destroy(global.armors_amount);
ds_list_destroy(global.accessories);
ds_list_destroy(global.accessories_amount);
font_delete(global.font)