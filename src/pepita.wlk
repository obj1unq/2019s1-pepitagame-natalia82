import ciudades.*
import wollok.game.*
import comidas.*

object pepita {

	var property energia = 70
	var property ciudad = buenosAires
	var property position = game.at(3, 3)

	method image() {
		if (energia > 100) {
			return "pepita-gorda-raw.png"
		} else {
			return "pepita.png"
		}
	}

	method come(comida) {
		energia = energia + comida.energia()
	}

	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		} else {
			game.say(self, "Ya estoy en !")
		}
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		if (energia > 0) {
			energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
			self.position(nuevaPosicion)
		} else {
			game.say(self, "Dame de comer, primero!")
		}
	}

	method volaYCome(comida) {
		self.volaHacia(comida)
		self.come(comida)
		game.removeVisual(comida)
	}

}

object roque {

	var property position = game.at(1, 2)
	var property alimento = noHayComida

	method image() {
		return "jugador.png"
	}

	method nombre() {
		return "roque"
	}

	
	method agarrar(comida) {
		self.alimento().tirar()
		game.removeVisual(comida)
		alimento = comida
	}

	method darComida(ave, comida) {
		
		ave.come(comida)
		
	}

}

object pepona {

	var property position = game.at(8, 8)

	method image() {
		return "pepona.png"
	}

	method nombre() {
		return "pepona"
	}

}

object pipa {

	var property position = game.at(6, 6)

	method image() {
		return "pepitaCanchera.png"
	}

	method nombre() {
		return "pepita"
	}

}
