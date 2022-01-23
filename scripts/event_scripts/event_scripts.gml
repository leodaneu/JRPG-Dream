///@arg event
///@arg id
///@arg script
///@arg arg1...*
function event_register_script(event, obj_id, script) {	
	var _event  = event;
	var _obj_id = obj_id;
	
	with (obj_event_manager) {		
		if (!ds_map_exists(event_map_, _event)) {
			var _listener_list = ds_list_create();
			ds_map_add_list(event_map_, _event, _listener_list);
		} else 
			var _listener_list = event_map_[? _event];
		
		var _listener_info; 
		_listener_info[0] = _obj_id;
		var _args_length  = argument_count - 2;
		var _i            = 0;
		
		repeat(_args_length) {
			_listener_info[_i + 1] = argument[_i + 2];
			_i++;
		}
	
		ds_list_add(_listener_list, _listener_info);
	}
}

function fire_event(event) {
    with (obj_event_manager) {
		var _event = event;
		
		if (ds_map_exists(event_map_, _event)) {
			var _listener_list = event_map_[? _event];
			var _length        = ds_list_size(_listener_list);
			
			var _i = 0;
			var _listener_info, _listener, _script, _args;
			
			repeat(_length) {
				_listener_info = _listener_list[| _i];
				_listener      = _listener_info[0];
				_script        = _listener_info[1];	
				
				var _args_length = array_length(_listener_info) - 2;
				var _unregister  = false;
				
				if (_args_length <= 0) {
					if (instance_exists(_listener))
						with(_listener) 
							_unregister = script_execute(_script);
					else 
						_unregister = true;	
				} else {					
					if (instance_exists(_listener)) {
						_args = array_create(_args_length, 0);
						array_copy(_args, 0, _listener_info, 2, _args_length);
						
						with(_listener)
							_unregister = script_execute_alt(_script, _args);					
					} else 
						_unregister = true;
				}
				
				if (_unregister) {
					event_unregister(_event, _listener);
					_i--;
				}
				_i++;
			}
		}
	}
}

function event_unregister(event, obj_id) {
	with (obj_event_manager) {
		var _event  = event;
		var _obj_id = obj_id;
		
		if (ds_map_exists(event_map_, _event)) {
			var _listener_list = event_map_[? _event];
			var _length        = ds_list_size(_listener_list);
			
			var _i = 0;
			repeat(_length) {
				var _listener_info = _listener_list[| _i];
				
				if (_listener_info[0] == _obj_id) {
					if (_length == 1) {
						ds_list_destroy(_listener_list);
						ds_map_delete(event_map_, _event);
					} else 
						ds_list_delete(_listener_list, _i);
					break;
				}
				_i++;
			}
		}
	}
}