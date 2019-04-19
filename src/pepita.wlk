import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	method image() { if (self.energia() > 100) { return "manzana.png"}
		else {return "pepita.png"}
    }
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (self.energiaParaVolar(position.distance(unaCiudad.position())) <= self.energia())
		 {if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		  } else { game.say(self, "Ya estoy aqui!")}}
		 else { game.say(self, "Dame de comer!!")}
		
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}
	// vuela y come
	method volaYCome(posicionComida, comida){
		self.move(posicionComida)
		self.come(comida)
		game.removeVisual(comida)
	}
}
