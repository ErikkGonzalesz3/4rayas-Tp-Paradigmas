import wollok.game.*
import jugador.*
import tablero.*
import example.*


//lógica del juego
object juego {
	const listaJugadores = []
	const tablero = new Tablero ()

	method iniciarJuego () {
		tablero.inciarTablero()
	}

	method quiereJugar (numero) {
	}
}
/*Clase abstracta */
class Jugador {
	// const property color
	const casillasOcupadas = []
	// var property position 
	method image ()
	
	method mover (columna) {

	}
}

object rojo  {
	method image () = "rojo.png"
	method marcarFicha() {game.addVisual(self)}
}

object amarillo  {
	method image () = "amarillo.png"
	method marcarFicha() {game.addVisual(self)}
}


