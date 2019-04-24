
import wollok.game.*
import pepita.*

object manzana {
	method image(){
			
			return "manzana.png"
		}
	
	method energia() = 80
	
	method position() = game.at(5,1)
	method tirar() {
		game.addVisualIn(self, game.at((0.randomUpTo(6).roundUp(0)), (0.randomUpTo(6).roundUp(0))))
		game.whenCollideDo(self, { roque => roque.agarrar(self)})
	}
	
}

object alpiste {

		method image(){
	
			return "alpiste.png"
		}
	
	method energia() = 40
	
	method position() = game.at(5,5)
	method tirar() {
		game.addVisualIn(self, game.at((0.randomUpTo(6).roundUp(0)), (0.randomUpTo(6).roundUp(0))))
		game.whenCollideDo(self, { roque => roque.agarrar(self)})
	}
}

object noHayComida {

		method energia() = 0
		method tirar(){}
}
