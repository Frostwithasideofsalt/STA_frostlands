/*================*\
| GLOBAL VARIABLES |
\*================*/

::gvMap <- 0
::gvGameMode <- 0
::gvQuit <- false
::game <- { //Globals stored in this table will be saved
	difficulty = 0
	file = 0
	coins = 0
	levelcoins = 0
	maxcoins = 0 //Total coins in the level
	secrets = 0
	enemies = 0
	lives = 0
	health = 4
	maxHealth = 4
	weapon = 0
	maxenergy = 0
	subitem = 0
	completed = {} //List of completed level names
	allcoins = {} //Levels that the player has gotten all enemies in
	allenemies = {} //Levels that the player has beaten all enemies in
	allsecrets = {} //Levels the player has found all secrets in
	besttime = {} //Fastest time for a level
	igt = 0 //Global IGT, which increments throughout the game's runtime
	colorswitch = [
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false
	] //Color blocks activated by respective switches
	characters = { //List of unlocked characters
		Tux = [sprTuxOverworld, sprTuxDoll]
	}
	friends = {} //List of rescued friend characters
	playerchar = "Tux" //Current player character
	world = "res/map/overworld-0.json"
	owx = 0
	owy = 0
	owd = 0
	check = false //If a checkpoint has been activated
	chx = 0
	chy = 0
}
::gameDefault <- clone(game)
::gvPlayer <- 0; //Pointer to player actor
/*\
 # When characters are unlocked, they will
 # be added to game.characters. Mods can
 # push a similar array to make their
 # custom characters playable.
\*/

::strDifficulty <- []

::config <- {
	key = {
		up = k_up
		down = k_down
		left = k_left
		right = k_right
		jump = k_z
		shoot = k_x
		run = k_lshift
		sneak = k_lctrl
		pause = k_escape
		swap = k_a
		accept = k_enter
	},
	joy = {
		jump = 0
		shoot = 2
		run = 4
		sneak = 5
		pause = 7
		swap = 3
		accept = 0
	}
	playerchar = 0
	lang = "en"
	showigt = false
}

::gvScreen <- 0
::gvPlayScreen <- 0
::camx <- 0
::camy <- 0
::camxprev <- 0
::camyprev <- 0

//Debug variabls
::gvFPS <- 0

::gvWeather <- 0
::gvIGT <- 0 //In-game time for the current level
::gvDoIGT <- true