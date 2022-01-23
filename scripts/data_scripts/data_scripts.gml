function save_game() {
	if (!instance_exists(obj_player_stats)) exit;
	if (!instance_exists(obj_player)) exit;

	var _save_data = ds_map_create();

	with (obj_player) {
	    _save_data[? "x"]    = x;
	    _save_data[? "y"]    = y;
	    _save_data[? "room"] = room;
	}

	with (obj_player_stats) {
	    _save_data[? "level"] = level_;
    
	    var _save_items = ds_list_create();
	    ds_list_copy(_save_items, items_);
	    ds_map_add_list(_save_data, "items", _save_items);
    
	    var _save_item_number = ds_list_create();
	    ds_list_copy(_save_item_number, item_number_);
	    ds_map_add_list(_save_data, "item number", _save_item_number);

	    // TODO: Save cutscenes played
	}

	var _save_string = json_encode(_save_data);
	ds_map_destroy(_save_data);

	_save_string = base64_encode(_save_string);

	var _save_file = file_text_open_write(working_directory + "save.txt");
	file_text_write_string(_save_file, _save_string);
	file_text_close(_save_file);
	show_debug_message("Game saved");
}

function load_game() {
	if (!instance_exists(obj_player_stats)) exit;
	if (!instance_exists(obj_player)) exit;

	var _save_file = file_text_open_read(working_directory + "save.txt");

	if (_save_file) {
	    var _save_string = file_text_read_string(_save_file);
	    file_text_close(_save_file);
    
	    _save_string = base64_decode(_save_string);
	    var _save_data = json_decode(_save_string);
    
	    with (obj_player) {
	        x          = _save_data[? "x"];
	        y          = _save_data[? "y"];
	        last_room_ = noone; 
	    }
   
	    with (obj_player_stats) {
	        level_ = _save_data[? "level"];
	        get_stats_from_class("elizabeth"); 
	        draw_health_ = stats_[? "health"];
        
	        ds_list_copy(items_, _save_data[? "items"]);
	        ds_list_copy(item_number_, _save_data[? "item number"]);
	    }
    
	    room_goto(_save_data[? "room"]);
    
	    ds_map_destroy(_save_data);
	    show_debug_message("Game loaded.");
	} else {
	    show_debug_message("No save file.");
	}
}

function ini_save(filename) {
	if (file_exists(filename)) {
		file_delete(filename);
	}

	ini_open(filename);

	ini_write_string("Level", "Room", room_get_name(room));
	ini_write_real("Level", "Start x", global.player_start_position.x);
	ini_write_real("Level", "Start y", global.player_start_position.y);
	ini_write_real("Player", "Health", global.player_health);
	ini_write_real("Player", "Max Health", global.player_max_health);
	ini_write_real("Player", "Stamina", global.player_stamina);
	ini_write_real("Player", "Max Stamina", global.player_max_stamina);
	ini_write_inventory("Player", "Inventory", global.inventory);
	ini_write_inventory("Player", "Active Items", global.item);
	ini_write_string_array("World", "Detroyed Objects", global.destroyed);

	ini_close();
}

function ini_write_inventory(section, name, inventory_array) {
	var _array_length = array_length(inventory_array);

	for (var _i = 0; _i < _array_length; _i++) {
		var _value = inventory_array[_i];
	
		if (instance_exists(_value))
			ini_write_string(section, name + string(_i), object_get_name(_value.object_index));
		else 
			ini_write_string(section, name + string(_i), string(_value));
	}
}

function ini_write_string_array(section, name, array) {
	var _array_size = array_length(array);

	for (var _i = 0; _i < _array_size; _i++) {
		var _value = array[_i];
		ini_write_string(section, name + string(_i), _value);
	}
}

function ini_load(filename) {
	if (!file_exists(filename)) exit;

	global.load = true;

	ini_open(filename);

	var _room_name            = ini_read_string("Level", "Room", "");
	global.start_x            = ini_read_real("Level", "Start x", 0);
	global.start_y            = ini_read_real("Level", "Start y", 0);
	global.player_health      = ini_read_real("Player", "Health", 1);
	global.player_max_health  = ini_read_real("Player", "Max Health", 1);
	global.player_stamina     = ini_read_real("Player", "Stamina", 1);
	global.player_max_stamina = ini_read_real("Player", "Max Stamina", 1);
	global.inventory          = ini_read_inventory("Player", "Inventory", []);
	global.item               = ini_read_inventory("Player", "Active Items", []);
	global.destroyed          = ini_read_string_array("World", "Destroyed Objects", []);
	ini_close();

	if (_room_name == "")
		show_error("No save data", false);

	var _room = asset_get_index(_room_name);
	room_goto(_room);
}

function ini_read_inventory(section, name, standard) {
	var _array = [];
	var _i     = 0;

	while(ini_key_exists(section, name + string(_i))) {
		var _value  = ini_read_string(section, name + string(_i), "-4");
		var _object = asset_get_index(_value);
	
		if (_object == -1)
			_object = noone;
		else 
			_object = singleton(_object);
	
		_array[_i] = _object;
		_i++;
	}

	if (array_length(_array) > 0)
		return _array;
	else 
		return standard;	
}

function ini_read_string_array(section, name, standard) {
	var _array = [];
	var _i     = 0;

	while (ini_key_exists(section, name + string(_i))) {
		var _value = ini_read_string(section, name  + string(_i), "");
		_array[_i] = _value;
		_i++;
	}

	if (array_length(_array) > 0)
		return _array;
	else 
		return standard;
}

function create_ds_grid_from_array(array) {
	var _num_quests  = array_length(array);
	var _array_width = array_length(array[0]);
	var _ds_grid     = ds_grid_create(_array_width, _num_quests);
	
	var _i = 0;
	repeat(_num_quests) {
		var _quest = array[_i];
		var _j     = 0;
		repeat(_array_width) {
			_ds_grid[# _j, _i] = _quest[_j];
			_j++;
		}
		_i++;
	}
	
	return _ds_grid;
}