import wollok.game.*
import tablero.*
import juego.*

class Ficha {

	var color
	

	var posicion

	var property imagen = "assets/ficha" + color + ".png"
	

	method fila() { 
		return posicion.y() 
	}

	method columna() { 
		return posicion.x() 
	}
}

class FilaSuperior {
	var posicion = 0 

	method moverA(nuevaPosicion) {
		posicion = nuevaPosicion 
	}

	method obtenerPosicion() {
		return posicion
	}
}

object controles {
	
	var property juego = null 
	
	var filaSuperior = new FilaSuperior()
	var fichaVisual = null 

	
	method configurar(juegoPrincipal) {
		juego = juegoPrincipal
	}
	
	method setFicha(color) {
		if (fichaVisual != null) {
			game.removeVisual(fichaVisual)
		}
		filaSuperior.moverA(0) 
		const col = filaSuperior.obtenerPosicion()
		fichaVisual = new Ficha(color = color, posicion = game.at(col, 6))
		game.addVisual(fichaVisual)
	}

	method moverIzquierda() {
		if (not juego.juegoTerminado()) {
			var col = filaSuperior.obtenerPosicion()
			if (col > 0) {
				col--
				filaSuperior.moverA(col)
				fichaVisual.position(game.at(col, 6))
			}
		}
	}
	
	method moverDerecha() {
		if (not juego.juegoTerminado()) {
			var col = filaSuperior.obtenerPosicion()
			if (col < 7 - 1) {
				col++
				filaSuperior.moverA(col)
				fichaVisual.position(game.at(col, 7))
			}
		}
	}

	method removerVisual() {
		if (fichaVisual != null) {
			game.removeVisual(fichaVisual)
		}
	}

	method soltarFicha() {
		juego.soltarFicha(filaSuperior.obtenerPosicion())
	}
}
