
function get_armor_data(){
// This may end up in an external file, for now it is here
	return json_decode(@"{
	 "+"\""+@"bronze_plate"+"\""+@" : {
	        "+"\""+@"name"+"\""+@"          : "+"\""+@"Bronze Plate"+"\""+@",
	        "+"\""+@"effect"+"\""+@"        : 0,
	        "+"\""+@"info"+"\""+@"          : "+"\""+@"A bronze armor."+"\""+@",
			"+"\""+@"strength"+"\""+@"      : 0,
			"+"\""+@"speed"+"\""+@"         : 5,
	        "+"\""+@"skill"+"\""+@"         : 0,
	        "+"\""+@"battle"+"\""+@"        : 0,
	    },
	    "+"\""+@"black_robe"+"\""+@" : {
	        "+"\""+@"name"+"\""+@"          : "+"\""+@"Black Robe"+"\""+@",
	        "+"\""+@"effect"+"\""+@"        : 0,
	        "+"\""+@"info"+"\""+@"          : "+"\""+@"A black Robe."+"\""+@",
			"+"\""+@"strength"+"\""+@"      : 0,
			"+"\""+@"speed"+"\""+@"         : 10,
	        "+"\""+@"skill"+"\""+@"         : 0,
	        "+"\""+@"battle"+"\""+@"        : 0,
	    },
		"+"\""+@"iron_cuirass"+"\""+@" : {
	        "+"\""+@"name"+"\""+@"          : "+"\""+@"Iron Cuirass"+"\""+@",
	        "+"\""+@"effect"+"\""+@"        : 0,
	        "+"\""+@"info"+"\""+@"          : "+"\""+@"A Iron Cuirass."+"\""+@",
			"+"\""+@"strength"+"\""+@"      : 25,
			"+"\""+@"speed"+"\""+@"         : 10,
	        "+"\""+@"skill"+"\""+@"         : 0,
	        "+"\""+@"battle"+"\""+@"        : 0,
	    },
	}");
}