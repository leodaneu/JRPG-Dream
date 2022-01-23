function view_approach(target_x, target_y, width, height, amount, zoom_amount) {
	// This function is used to move the view. 
	// It also takes a new view width and height to allow for zooming.	
	x = lerp(x, target_x, amount);
	y = lerp(y, target_y, amount);

	var _cam = view_get_camera(0);
	var _vw  = camera_get_view_width(_cam);
	var _vh  = camera_get_view_height(_cam);

	// Get the change
	var _vwc = (_vw - width) * zoom_amount;
	var _vhc = (_vh - height) * zoom_amount;

	// Scale the view
	view_set_width(0, view_get_width(0) - _vwc);
	view_set_height(0, view_get_height(0) - _vhc);
}

function view_set_width(index, value) {
	var _cam        = view_get_camera(index);
	var _resolution = camera_get_view_height(_cam);

	camera_set_view_size(_cam, value, _resolution);
}

function view_set_height(index, value) {
	var _cam        = view_get_camera(index);
	var _resolution = camera_get_view_width(_cam);

	camera_set_view_size(_cam, _resolution, value);
}

function view_get_width(index) {
	var _cam        = view_get_camera(index);
	var _resolution = camera_get_view_width(_cam);

	return _resolution;
}

function view_get_height(index) {
	var _cam        = view_get_camera(index);
	var _resolution = camera_get_view_height(_cam);

	return _resolution;
}

function view_screenshake(amount, duration) {
	if (instance_exists(obj_camera_parent)) {
	    obj_camera_parent.screenshake_ = amount;
	    obj_camera_parent.alarm[0]     = duration;
	}
}

function view_get_width_y(index) {
	var _cam        = view_get_camera(index);
	var _resolution = camera_get_view_y(_cam);

	return _resolution;
}