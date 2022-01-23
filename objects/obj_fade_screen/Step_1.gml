if (leading_ == leading.in) {
	percent_ = max(0, percent_ - transition_spd_);
	
	if (percent_ <= 0) {
		instance_destroy();
	}
} else {
	percent_ = min(1, percent_ + transition_spd_);
	//if (percent_ >= 1)
		//leading_ = leading.in;
}