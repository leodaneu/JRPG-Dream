/// @description Found Item State Alarm
if (instance_exists(obj_message_ui)) {
	with (obj_message_ui)
		instance_destroy();
}