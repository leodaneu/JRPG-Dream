
function get_weapon_data(){
// This may end up in an external file, for now it is here
	return json_decode(@"{
	 "+"\""+@"wooden_sword"+"\""+@" : {
	        "+"\""+@"name"+"\""+@"          : "+"\""+@"Wooden Sword"+"\""+@",
	        "+"\""+@"effect"+"\""+@"        : 0,
	        "+"\""+@"info"+"\""+@"          : "+"\""+@"A shitty sword."+"\""+@",
			"+"\""+@"strength"+"\""+@"      : 10,
			"+"\""+@"speed"+"\""+@"         : 5,
	        "+"\""+@"skill"+"\""+@"         : 0,
	        "+"\""+@"battle"+"\""+@"        : 0,
	    },
	    "+"\""+@"iron_sword"+"\""+@" : {
	        "+"\""+@"name"+"\""+@"          : "+"\""+@"Iron Sword"+"\""+@",
	        "+"\""+@"effect"+"\""+@"        : 0,
	        "+"\""+@"info"+"\""+@"          : "+"\""+@"A regular sword."+"\""+@",
			"+"\""+@"strength"+"\""+@"      : 20,
			"+"\""+@"speed"+"\""+@"         : 10,
	        "+"\""+@"skill"+"\""+@"         : 0,
	        "+"\""+@"battle"+"\""+@"        : 0,
	    },
		"+"\""+@"bronze_sword"+"\""+@" : {
	        "+"\""+@"name"+"\""+@"          : "+"\""+@"Bronze Sword"+"\""+@",
	        "+"\""+@"effect"+"\""+@"        : 0,
	        "+"\""+@"info"+"\""+@"          : "+"\""+@"A good sword."+"\""+@",
			"+"\""+@"strength"+"\""+@"      : 25,
			"+"\""+@"speed"+"\""+@"         : 10,
	        "+"\""+@"skill"+"\""+@"         : 0,
	        "+"\""+@"battle"+"\""+@"        : 0,
	    },
		"+"\""+@"iron_spear"+"\""+@" : {
	        "+"\""+@"name"+"\""+@"          : "+"\""+@"Iron Spear"+"\""+@",
	        "+"\""+@"effect"+"\""+@"        : 0,
	        "+"\""+@"info"+"\""+@"          : "+"\""+@"A regular spear."+"\""+@",
			"+"\""+@"strength"+"\""+@"      : 25,
			"+"\""+@"speed"+"\""+@"         : 15,
	        "+"\""+@"skill"+"\""+@"         : 0,
	        "+"\""+@"battle"+"\""+@"        : 0,
	    },
	}");
}