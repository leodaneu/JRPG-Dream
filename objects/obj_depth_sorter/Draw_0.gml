var _depth_grid      = depth_grid_;
var _instance_number = instance_number(obj_parent_depth);

ds_grid_resize(_depth_grid, 2, _instance_number);

var _i = 0;

with(obj_parent_depth) {
	if (object_is_ancestor(object_index, obj_parent_depth)) {
		_depth_grid[# 0, _i] = id;
		_depth_grid[# 1, _i] = y;
		_i++;	
	}
}

ds_grid_sort(_depth_grid, 1, true);

var _j = 0;
var _instance;

repeat(_instance_number) {
	 _instance = _depth_grid[# 0, _j];
	 
	 with(_instance)
		if (can_draw_)
			event_perform(ev_draw, 0); 	
	_j++;
}