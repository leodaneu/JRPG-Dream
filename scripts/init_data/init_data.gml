// PARTY//
enum party {
	claudio,
	cassio
}

global.party[party.claudio] = new Claudio();
global.party[party.cassio]  = new Cassio();

// ACTIONS //
enum actions {
	attack,
	guard
}

global.actions[actions.attack] = new Attack();
global.actions[actions.guard]  = new Guard();

// ENEMIES //
enum enemies {
	bat,
	porcupine
}

//global.enemies[enemies.bat] = script_execute(create_enemy);
global.enemies[enemies.bat] = new Bat();