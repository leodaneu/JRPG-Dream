event_inherited();
image_speed = .5;
//persistent  = true;
name_           = "Cassio";
text_id_        = noone;
record_         = 15;
starting_state_ = follower.stand;
state_          = starting_state_;
join_party_     = false;

sprite_[follower.follow, follower_dir.right] = spr_cassio_run_right;
sprite_[follower.follow, follower_dir.up]    = spr_cassio_run_up;
sprite_[follower.follow, follower_dir.left]  = spr_cassio_run_right;
sprite_[follower.follow, follower_dir.down]  = spr_cassio_run_down;

if (is_in_destroyed_list(id))
	join_party_ = true;