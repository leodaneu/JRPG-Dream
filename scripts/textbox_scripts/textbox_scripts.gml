function scr_set_defaults_for_text() {
	line_break_pos_[0, page_number_] = 999;
	line_break_num_[page_number_]    = 0;
	line_break_offset_[page_number_] = 0;
	
	for (var _i = 0; _i < 300; _i++) {
		col_1_[_i, page_number_] = c_white;
		col_2_[_i, page_number_] = c_white;
		col_3_[_i, page_number_] = c_white;
		col_4_[_i, page_number_] = c_white;
		
		float_text_[_i, page_number_] = 0;
		float_dir_[_i, page_number_]  = _i * 20;
		
		shake_text_[_i, page_number_]  = 0;
		shake_dir_[_i, page_number_]   = irandom(360);
		shake_timer_[_i, page_number_] = irandom(4);
	}
	
	textbox_spr_[page_number_]    = spr_textbox;
	speaker_sprite_[page_number_] = noone;
	speaker_side_[page_number_]   = 1;
	sound_[page_number_]          = aud_menu_select;
}

function scr_text_color(first_char, last_char, col_1, col_2, col_3, col_4) {
	for (var _i = first_char; _i <= last_char; _i++) {
		col_1_[_i, page_number_ - 1] = col_1;
		col_2_[_i, page_number_ - 1] = col_2;
		col_3_[_i, page_number_ - 1] = col_3;
		col_4_[_i, page_number_ - 1] = col_4;
	}
}

function scr_text_float(first_char, last_char) {
	for (var _i = first_char; _i <= last_char; _i++) {
		float_text_[_i, page_number_ - 1] = true;
	}
}

function scr_text_shake(first_char, last_char) {
	for (var _i = first_char; _i <= last_char; _i++) {
		shake_text_[_i, page_number_ - 1] = true;
	}
}

/// @param text
/// @param [character]
/// @param [emotion]
/// @param [side]
function scr_text(text) {
	scr_set_defaults_for_text();
	text_[page_number_] = text; 
	
	if (argument_count > 1) {
		var _character                = ds_map_find_value(obj_game.party_, argument[1]);
		speaker_sprite_[page_number_] = _character.speaker_[argument[2]];
		textbox_spr_[page_number_]    = _character.textbox_;
		speaker_side_[page_number_]   = argument[3];
	}
	
	page_number_++;
}

function scr_game_text(text_id) {
	switch(text_id) {
		
		case "coringa":
			scr_text("Are you aware of how great the Bogdanoff brothers were?");
				scr_option("Yes.", "npc_1_yes");
				scr_option("Who?!", "npc_1_no_1");
				scr_option("No.", "npc_1_no_2");
			break;
			case "npc_1_yes":
				scr_text("You talk like a chad. I like you.");
			break;
			case "npc_1_no_1":
				scr_text("Pathetic ...")
			break;
			case "npc_1_no_2":
				scr_text("Your generation is lost.");
			break;
		
		case "rafa_gordo":
			scr_text("The age of heroes and great deeds is gone...");
				scr_text_float(5, 12);
				scr_text_shake(56, 72);
			scr_text("Men no longer seek virtue, but self indulgence and pleasure.");
			scr_text("Be not one of them, lad.");
			scr_text("I warn you, do not conform to the spirit of the times.");
			scr_text("Seek sacrifice, justice and beauty.");
			scr_text("Seek death and rebirth.");
		break;	
			
		case "join_party_cassio":
			scr_text("You were worthy of taking the sword out of the stone!!");
			scr_text("That is quite impressive, I must say.");
			scr_text("From now on, I, Cassio the Fox will be an ally on your quest to reach the Ubermensch!");
		break;	
	}		
}

function create_textbox(text_id) {
	with (instance_create_layer(0, 0, "Instances", obj_textbox)) {
		scr_game_text(text_id)
	}
}

function create_textbox_cutscene(text_id) {
	//with (instance_create_depth(0, 0, -9999, obj_textbox)) {
	with (instance_create_depth(0, 0, -10000, obj_textbox)) {
		scr_game_text(text_id)
	}
}

function scr_option(option, link_id) {
	options_[option_number_]         = option;
	options_link_id_[option_number_] = link_id;
	
	option_number_++;
}