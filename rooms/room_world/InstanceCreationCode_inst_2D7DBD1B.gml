text_id_ = "rafa_gordo";

if (instance_exists(obj_event_manager)) {
	if (!ds_map_exists(obj_event_manager.event_map_, event.allow_cassio_party)) {
		event_register_script(event.allow_cassio_party, id, allow_join_party, "Cassio", party.cassio);
		event_register_script(event.cassio_party, id, join_party, "Cassio", party.cassio);
	}
}