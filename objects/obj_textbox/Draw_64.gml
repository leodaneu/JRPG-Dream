accept_key_ = obj_input.action_;
//textbox_x_  = camera_get_view_x(view_camera[0]);
//textbox_y_  = camera_get_view_y(view_camera[0]);

if (!setup_) {
	setup_ = true;
	draw_set_font(global.font);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	for (var _i = 0; _i < page_number_; _i++) {
		text_length_[_i]       = string_length(text_[_i]);
		text_x_offset[_i]      = 80;
		portrait_x_offset_[_i] = 8;
		
		if (speaker_side_[_i] == -1) {
			text_x_offset[_i]      = 8;
			portrait_x_offset_[_i] = 216;
		}
		
		if (speaker_sprite_[_i] == noone)
			text_x_offset[_i] = 44;
	
		for (var _j = 0; _j < text_length_[_i]; _j++) {
			var _char_pos = _j + 1;
			char_[_j, _i] = string_char_at(text_[_i], _char_pos);
			
			var _text_up_to_char    = string_copy(text_[_i], 1, _char_pos);
			var _current_text_width = (string_width(_text_up_to_char) - string_width(char_[_j, _i]));
			
			if (char_[_j, _i] == " ")
				last_free_space_ = _char_pos + 1;
				
			if (_current_text_width - line_break_offset_[_i] > line_width_) {
				line_break_pos_[line_break_num_[_i], _i] = last_free_space_;
				line_break_num_[_i]++;
				
				var _text_up_to_last_space  = string_copy(text_[_i], 1, last_free_space_);
				var _last_free_space_string = string_char_at(text_[_i], last_free_space_);			
				line_break_offset_[_i]      = string_width(_text_up_to_last_space) - string_width(_last_free_space_string);
			}	
		}
		
		for (var _j = 0; _j < text_length_[_i]; _j++) {
			var _char_pos = _j + 1;
			var _text_x   = textbox_x_ + text_x_offset[_i] + border_;
			var _text_y   = textbox_y_ + border_;
			
			var _text_up_to_char    = string_copy(text_[_i], 1, _char_pos);
			var _current_text_width = (string_width(_text_up_to_char) - string_width(char_[_j, _i])) * .8;
			var _text_line          = 0;
			
			for (var _k = 0; _k < line_break_num_[_i]; _k++) {
				if (_char_pos >= line_break_pos_[_k, _i]) {
					var _string_copy    = string_copy(text_[_i], line_break_pos_[_k, _i], _char_pos - line_break_pos_[_k, _i]);
					_current_text_width = string_width(_string_copy) * .8;
					_text_line          = _k + 1;
				}
			}
			
			char_x_[_j, _i] = _text_x + _current_text_width;
			char_y_[_j, _i] = _text_y + _text_line * line_separation_;
		}
	}
}

if (text_pause_timer_ <= 0) {
	if (draw_char_ < text_length_[page_]) {
		draw_char_ += text_speed_;
		draw_char_ = clamp(draw_char_, 0, text_length_[page_]);
	
		var _check_char = string_char_at(text_[page_], draw_char_);
	
		if (_check_char == "." or _check_char == "!" or _check_char == "?" or _check_char == ",") {
			text_pause_timer_ = text_pause_time_;
			
			if (!audio_is_playing(sound_[page_]))
				audio_play_sound(sound_[page_], 8, false);
		
		} else {
			if (sound_count_ < sound_delay_)
				sound_count_++;
			else {
				sound_count_ = 0;
				audio_play_sound(sound_[page_], 8, false);
			}	
		}	
	}
} else {
	text_pause_timer_--;
}

if (accept_key_) {
	if (draw_char_ == text_length_[page_]) {
		if (page_ < page_number_ - 1) {
			page_++;
			draw_char_ = 0;
		} else {
			if (option_number_ > 0)
				create_textbox(options_link_id_[option_pos_]);
			instance_destroy();
		}	
	} else
		draw_char_ = text_length_[page_];
}

// draw the textbox
var _textbox_x = textbox_x_ + text_x_offset[page_];
var _textbox_y = textbox_y_;
textbox_image_ += textbox_speed_;
textbox_spr_w_ = sprite_get_width(textbox_spr_[page_]);
textbox_spr_h_ = sprite_get_height(textbox_spr_[page_]);

// draw the speaker
if (speaker_sprite_[page_] != noone) {
	sprite_index = speaker_sprite_[page_];
	
	if (draw_char_ == text_length_[page_])
		image_index = 0;
	
	var _speaker_x = textbox_x_ + portrait_x_offset_[page_];
	
	if (speaker_side_[page_] == -1)
		_speaker_x += sprite_width;
		
	draw_sprite_ext(textbox_spr_[page_], textbox_image_, textbox_x_ + portrait_x_offset_[page_], textbox_y_, sprite_width / textbox_spr_w_, sprite_height / textbox_spr_h_, 0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y_, speaker_side_[page_], 1, 0, c_white, 1);
}

draw_sprite_ext(textbox_spr_[page_], textbox_image_, _textbox_x, _textbox_y, textbox_width_ / textbox_spr_w_, textbox_height_ / textbox_spr_h_, 0, c_white, 1);

if (draw_char_ == text_length_[page_] and page_ == page_number_ - 1) {
	option_pos_ += obj_input.down_pressed_ - obj_input.up_pressed_;
	option_pos_ = clamp(option_pos_, 0, option_number_ - 1);
	
	if (obj_input.down_pressed_ - obj_input.up_pressed_ != 0)
		audio_play_sound(aud_menu_move, 3, false);
	
	var _option_space  = 15;
	var _option_border = 4;
	
	
	for (var _i = 0; _i < option_number_; _i++) {
		var _color        = purple_gray_;
		var _option_width = string_width(options_[_i]) + _option_border * 2;
		draw_sprite_ext(textbox_spr_[page_], textbox_image_, _textbox_x, _textbox_y - _option_space * option_number_ + _option_space * _i, _option_width / textbox_spr_w_, (_option_space ) / textbox_spr_h_, 0, c_white, 1);
		
		if (option_pos_ == _i) {
			_color = c_white;
			//draw_sprite(spr_ui_caret, 0, _textbox_x, _textbox_y - _option_space * option_number_ + _option_space * _i);
		}
		
		//draw_text(_textbox_x + 16 + _option_border, _textbox_y - _option_space * option_number_ + _option_space * _i + 2, options_[_i]);
		draw_text_transformed_color(_textbox_x + _option_border, _textbox_y - _option_space * option_number_ + _option_space * _i + 2, options_[_i], .8, .8, 0, _color, _color, _color, _color, 1);
	}
}

for (var _i = 0; _i < draw_char_; _i++) {
	var _float_y = 0;
	
	if (float_text_[_i, page_] == true) {
		float_dir_[_i, page_] += -6;
		_float_y = dsin(float_dir_[_i, page_]) * 2;
	}
	
	var _shake_x = 0
	var _shake_y = 0;
	
	if (shake_text_[_i, page_] == true) {
		shake_timer_[_i, page_]--;
		
		if (shake_timer_[_i, page_] <= 0) {
			shake_timer_[_i, page_] = irandom_range(4, 8);
			shake_dir_[_i, page_]   = irandom(360);
		}
		if (shake_timer_[_i, page_] <= 2) {
			_shake_x = lengthdir_x(1, shake_dir_[_i, page_]);
			_shake_y = lengthdir_y(1, shake_dir_[_i, page_]);
		}
	}
	
	//draw_text_color(char_x_[_i, page_] + _shake_x, char_y_[_i, page_] + _shake_y, char_[_i, page_], col_1_[_i, page_], col_2_[_i, page_], col_3_[_i, page_], col_4_[_i, page_], 1);
	draw_text_transformed_color(char_x_[_i, page_] + _shake_x, char_y_[_i, page_] + _shake_y, char_[_i, page_], .8, .8, 0, col_1_[_i, page_], col_2_[_i, page_], col_3_[_i, page_], col_4_[_i, page_], 1);
	
	//var _drawtext = string_copy(text_[page_], 1, draw_char_);
	//draw_text_ext(_textbox_x + border_, _textbox_y + border_, _drawtext, line_separation_, line_width_);
}