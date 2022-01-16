/*============*\
| ITEMS SOURCE |
\*============*/

::Coin <- class extends Actor{
	frame = 0.0

	constructor(_x, _y, _arr = null)
	{
		base.constructor(_x, _y)
		frame = randFloat(4)
		game.maxcoins++
	}

	function run()
	{
		frame += 0.1
		drawSprite(sprCoin, frame, x - camx, y - camy)
		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y + 2) <= 14) {
			deleteActor(id)
			newActor(CoinEffect, x, y)
		}
	}

	function _typeof() { return "Coin" }
}

::Coin1 <- class extends Actor{
	frame = 0.0

	constructor(_x, _y, _arr = null)
	{
		base.constructor(_x, _y)
		frame = randFloat(4)
		game.maxcoins++
	}

	function run()
	{
		frame += 0.1
		drawSprite(sprCoin1, frame, x - camx, y - camy)
		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y + 2) <= 14) {
			deleteActor(id)
			game.levelcoins++
			playSound(sndCoinN, 0)
			newActor(c1, x, y)
			newActor(c1, x + 4, y + 2)
			newActor(c1, x - 4, y + 2)
		}
	}

}

::Coin5 <- class extends Actor{
	frame = 0.0

	constructor(_x, _y, _arr = null)
	{
		base.constructor(_x, _y)
		frame = randFloat(4)
		game.maxcoins += 5
	}

	function run()
	{
		frame += 0.1
		drawSprite(sprCoin5, frame, x - camx, y - camy)
		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y + 2) <= 14) {
			deleteActor(id)
			game.levelcoins += 5
			playSound(sndCoinN, 0)
			newActor(c5, x, y)
			newActor(c5, x + 4, y + 2)
			newActor(c5, x - 4, y + 2)
		}
	}

}

::Coin10 <- class extends Actor{
	frame = 0.0

	constructor(_x, _y, _arr = null)
	{
		base.constructor(_x, _y)
		frame = randFloat(4)
		game.maxcoins += 10
	}

	function run()
	{
		frame += 0.1
		drawSprite(sprCoin10, frame, x - camx, y - camy)
		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y + 2) <= 14) {
			deleteActor(id)
			game.levelcoins += 10
			playSound(sndCoinN, 0)
			newActor(c10, x, y)
			newActor(c10, x + 4, y + 2)
			newActor(c10, x - 4, y + 2)
		}
	}

}

::FlowerFire <- class extends Actor{

	constructor(_x, _y, _arr = null)
	{
		base.constructor(_x, _y)
	}

	function run()
	{
		drawSprite(sprFlowerFire, getFrames() / 16, x - camx, y - camy)
		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y + 2) <= 14) {
			deleteActor(id)
			if(game.weapon == 0) {
				game.weapon = 1
				game.maxenergy = 1
			}
			else if(game.weapon == 1) {
				if(game.maxenergy < 4 - game.difficulty) game.maxenergy++
				else game.subitem = 1
			}
			else {
				game.subitem = game.weapon
				game.maxenergy = 1
				game.weapon = 1
			}
			playSound(sndHeal, 0)
			if(gvPlayer.rawin("tftime")) gvPlayer.tftime = 0
		}
	}

	function _typeof() { return "FlowerFire" }
}

::FlowerIce <- class extends Actor{

	constructor(_x, _y, _arr = null)
	{
		base.constructor(_x, _y)
	}

	function run()
	{
		drawSprite(sprFlowerIce, getFrames() / 16, x - camx, y - camy)
		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y + 2) <= 14) {
			deleteActor(id)
			if(game.weapon == 0) {
				game.weapon = 2
				game.maxenergy = 1
			}
			else if(game.weapon == 2) {
				if(game.maxenergy < 4 - game.difficulty) game.maxenergy++
				else game.subitem = 1
			}
			else {
				game.subitem = game.weapon
				game.maxenergy = 1
				game.weapon = 2
			}
			playSound(sndHeal, 0)
			if(gvPlayer.rawin("tftime")) gvPlayer.tftime = 0
		}
	}

	function _typeof() { return "FlowerIce" }
}

::MuffinBlue <- class extends PhysAct {
	flip = false
	willwrite = false

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)
		shape = Rec(x, y, 4, 7, 0)

		if(gvPlayer != 0) {
			if(x < gvPlayer.x) flip = true
		}

		if(_arr != null) willwrite = _arr
	}

	function run() {
		if(placeFree(x, y + 1)) {
			if(inWater(x, y)) vspeed += 0.01
			else vspeed += 0.1
		}
		if(placeFree(x, y + vspeed)) y += vspeed
		else vspeed /= 2

		if(y > gvMap.h + 8) deleteActor(id)

		if(flip) {
			if(placeFree(x - 0.5, y)) x -= 0.5
			else if(placeFree(x - 1.1, y - 0.5)) {
				x -= 0.5
				y -= 0.25
			} else if(placeFree(x - 1.1, y - 1.0)) {
				x -= 0.5
				y -= 0.5
			} else flip = false

			if(x <= 0) flip = false
		}
		else {
			if(placeFree(x + 1, y)) x += 0.5
			else if(placeFree(x + 1.1, y - 0.5)) {
				x += 0.5
				y -= 0.25
			} else if(placeFree(x + 1.1, y - 1.0)) {
				x += 0.5
				y -= 0.5
			} else flip = true

			if(x >= gvMap.w) flip = true
		}

		shape.setPos(x, y)

		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y) <= 14) {
			if(game.health < game.maxHealth) {
				game.health++
				for(local i = 0; i < 4; i++) {
					newActor(Heal, gvPlayer.x - 16 + randInt(32), gvPlayer.y - 16 + randInt(32))
				}
			}
			else if(game.subitem != 6 && (game.subitem == 0 || willwrite)) game.subitem = 5
			deleteActor(id)
			playSound(sndHeal, 0)
		}

		drawSprite(sprMuffin, 0, x - camx, y - camy)
	}
}

::MuffinRed <- class extends PhysAct {
	flip = false

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)
		shape = Rec(x, y, 4, 7, 0)

		if(gvPlayer != 0) {
			if(x < gvPlayer.x) flip = true
		}
	}

	function run() {
		if(placeFree(x, y + 1)) {
			if(inWater(x, y)) vspeed += 0.01
			else vspeed += 0.1
		}
		if(placeFree(x, y + vspeed)) y += vspeed
		else vspeed /= 2

		if(y > gvMap.h + 8) deleteActor(id)

		if(flip) {
			if(placeFree(x - 0.5, y)) x -= 0.5
			else if(placeFree(x - 1.1, y - 0.5)) {
				x -= 0.5
				y -= 0.25
			} else if(placeFree(x - 1.1, y - 1.0)) {
				x -= 0.5
				y -= 0.5
			} else flip = false

			if(x <= 0) flip = false
		}
		else {
			if(placeFree(x + 1, y)) x += 0.5
			else if(placeFree(x + 1.1, y - 0.5)) {
				x += 0.5
				y -= 0.25
			} else if(placeFree(x + 1.1, y - 1.0)) {
				x += 0.5
				y -= 0.5
			} else flip = true

			if(x >= gvMap.w) flip = true
		}

		shape.setPos(x, y)

		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y) <= 14) {
			if(game.health < game.maxHealth - 3) {
				game.health += 4
				for(local i = 0; i < 4; i++) {
					newActor(Heal, gvPlayer.x - 16 + randInt(32), gvPlayer.y - 16 + randInt(32))
				}
			}
			else if(game.health < game.maxHealth) {
				game.health = game.maxHealth
				for(local i = 0; i < 4; i++) {
					newActor(Heal, gvPlayer.x - 16 + randInt(32), gvPlayer.y - 16 + randInt(32))
				}
			}
			else game.subitem = 6
			deleteActor(id)
			playSound(sndHeal, 0)
		}

		drawSprite(sprMuffin, 1, x - camx, y - camy)
	}
}

::MuffinEvil <- class extends PhysAct {
	flip = false

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)
		shape = Rec(x, y, 4, 7, 0)

		if(gvPlayer != 0) {
			if(x > gvPlayer.x) flip = true
		}
	}

	function run() {
		if(placeFree(x, y + 1)) vspeed += 0.1
		if(placeFree(x, y + vspeed)) y += vspeed
		else vspeed /= 2

		if(y > gvMap.h + 8) deleteActor(id)

		if(flip) {
			if(placeFree(x - 0.5, y)) x -= 0.5
			else if(placeFree(x - 1.1, y - 0.5)) {
				x -= 0.5
				y -= 0.25
			} else if(placeFree(x - 1.1, y - 1.0)) {
				x -= 0.5
				y -= 0.5
			} else flip = false

			if(x <= 0) flip = false
		}
		else {
			if(placeFree(x + 1, y)) x += 0.5
			else if(placeFree(x + 1.1, y - 0.5)) {
				x += 0.5
				y -= 0.25
			} else if(placeFree(x + 1.1, y - 1.0)) {
				x += 0.5
				y -= 0.5
			} else flip = true

			if(x >= gvMap.w) flip = true
		}

		shape.setPos(x, y)

		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y) <= 14) {
			if(gvPlayer.blinking > 0) return
			if(gvPlayer.x < x) gvPlayer.hspeed = -1.0
			else gvPlayer.hspeed = 1.0
			gvPlayer.hurt = true
			deleteActor(id)
		}

		drawSprite(sprMuffin, 2, x - camx, y - camy)
	}
}

::Starnyan <- class extends PhysAct {
	hspeed = 0
	vspeed = -2

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)

		if(gvPlayer != 0) if(gvPlayer.x > x) hspeed = -1
		else hspeed = 1

		shape = Rec(x, y, 6, 6, 0)
	}

	function run() {
		if(!placeFree(x, y + 1)) vspeed = -3
		if(!placeFree(x + 1, y)) hspeed = -1
		if(!placeFree(x - 1, y)) hspeed = 1
		vspeed += 0.1

		if(placeFree(x + hspeed, y)) x += hspeed
		if(placeFree(x, y + vspeed)) y += vspeed
		else vspeed /= 2
		shape.setPos(x, y)

		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y) <= 16) {
			gvPlayer.invincible = 60 * 18
			deleteActor(id)
		}

		drawSprite(sprStar, getFrames() / 10, x - camx, y - camy)
	}
}

::AirFeather <- class extends PhysAct {
	vspeed = -2.0
	hspeed = 0.0
	frame = 1.5

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)

		if(gvPlayer != 0) if(x > gvPlayer.x) frame = 3.5
		shape = Rec(x, y, 6, 6, 0)
	}

	function run() {
		if(vspeed < 0.2) vspeed += 0.05

		if(floor(frame) == 0 || floor(frame) == 2) frame += 0.01
		else frame += 0.1

		if(frame >= 4.0) frame -= 4.0

		if(floor(frame) == 1) hspeed += 0.1
		if(floor(frame) == 3) hspeed -= 0.1

		x += hspeed
		y += vspeed
		shape.setPos(x, y)

		drawSprite(sprAirFeather, frame, x - camx, y - camy)

		if(gvPlayer != 0) if(hitTest(shape, gvPlayer.shape)){
			playSound(sndHeal, 0)
			if(game.weapon == 0) game.weapon = 3
			else {
				game.subitem = game.weapon
				game.maxenergy = 1
				game.weapon = 3
			}
			if(gvPlayer.rawin("tftime")) gvPlayer.tftime = 0
			deleteActor(id)
		}
	}
}

::FlyRefresh <- class extends Actor{
	function run() {
		if(gvPlayer != 0) if(distance2(gvPlayer.x, gvPlayer.y, x, y) <= 16) if(gvPlayer.rawin("energy") && game.weapon == 3) gvPlayer.energy = 4

		drawSpriteEx(sprTinyWind, getFrames() / 8, x - camx, y - camy - 8, 0, 2, 1, 1, 0.25)
		drawSpriteEx(sprTinyWind, getFrames() / 8, x - camx, y - camy + 8, 0, 0, 1, 1, 0.25)
		drawSprite(sprFlyRefresh, getFrames() / 8, x - camx, y - camy)
	}
}

::OneUp <- class extends PhysAct {
	hspeed = 0
	vspeed = -2

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)

		if(gvPlayer != 0) if(gvPlayer.x > x) hspeed = -1
		else hspeed = 1

		shape = Rec(x, y, 6, 6, 0)
	}

	function run() {
		if(!placeFree(x, y + 1)) vspeed = -3
		if(!placeFree(x + 1, y)) hspeed = -1
		if(!placeFree(x - 1, y)) hspeed = 1
		vspeed += 0.1

		if(placeFree(x + hspeed, y)) x += hspeed
		if(placeFree(x, y + vspeed)) y += vspeed
		else vspeed /= 2
		shape.setPos(x, y)

		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y) <= 16) {
			game.lives++
			game.lives++
			playSound(snd1up, 0)
			deleteActor(id)
		}

		drawSprite(game.characters[game.playerchar][1], game.weapon, x - camx, y + 8 - camy)
	}
}

::OneDown <- class extends PhysAct {
	hspeed = 0
	vspeed = -2

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)

		if(gvPlayer != 0) if(gvPlayer.x > x) hspeed = -1
		else hspeed = 1

		shape = Rec(x, y, 6, 6, 0)
	}

	function run() {
		if(!placeFree(x, y + 1)) vspeed = -3
		if(!placeFree(x + 1, y)) hspeed = -1
		if(!placeFree(x - 1, y)) hspeed = 1
		vspeed += 0.1

		if(placeFree(x + hspeed, y)) x += hspeed
		if(placeFree(x, y + vspeed)) y += vspeed
		else vspeed /= 2
		shape.setPos(x, y)

		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y) <= 16) {
			game.lives = game.lives - 1
			playSound(snd1up, 0)
			deleteActor(id)
		}

		drawSprite(::sprTuxDollEvil, 0, x - camx, y - camy)
	}
}

::MuffinBomb <- class extends PhysAct {
	flip = false

	constructor(_x, _y, _arr = null) {
		base.constructor(_x, _y)
		shape = Rec(x, y, 4, 7, 0)

		if(gvPlayer != 0) {
			if(x > gvPlayer.x) flip = true
		}
	}

	function run() {
		if(placeFree(x, y + 1)) vspeed += 0.1
		if(placeFree(x, y + vspeed)) y += vspeed
		else vspeed /= 2

		if(y > gvMap.h + 8) deleteActor(id)

		if(flip) {
			if(placeFree(x - 0.5, y)) x -= 0.5
			else if(placeFree(x - 1.1, y - 0.5)) {
				x -= 0.5
				y -= 0.25
			} else if(placeFree(x - 1.1, y - 1.0)) {
				x -= 0.5
				y -= 0.5
			} else flip = false

			if(x <= 0) flip = false
		}
		else {
			if(placeFree(x + 1, y)) x += 0.5
			else if(placeFree(x + 1.1, y - 0.5)) {
				x += 0.5
				y -= 0.25
			} else if(placeFree(x + 1.1, y - 1.0)) {
				x += 0.5
				y -= 0.5
			} else flip = true

			if(x >= gvMap.w) flip = true
		}

		shape.setPos(x, y)

		if(gvPlayer != 0) if(distance2(x, y, gvPlayer.x, gvPlayer.y) <= 14) {
			if(gvPlayer.blinking > 0) return
			if(gvPlayer.x < x) gvPlayer.hspeed = -1.0
			else gvPlayer.hspeed = 1.0
			newActor(BadExplode, x, y)
			deleteActor(id)
		}

		drawSprite(sprMuffin, 3, x - camx, y - camy)
	}
}

::Spakle <- class extends Actor{
	constructor(_x, _y, _arr = null)
	{
		base.constructor(_x, _y)
	}
		function run() {
	if(getFrames() % 3 == 0){	
	newActor(c1, x - 16 + randInt(32), y - 16 + randInt(100))
	}
	}
}

::Sparkle <- class extends Actor{
}