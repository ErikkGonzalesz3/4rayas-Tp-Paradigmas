import wollok.game.*
import jugador.*
import tablero.*
import example.*

const filas = 6
const columnas = 7

object juego {
	const tablero = new Tablero()
	const listaJugadores = []
	var property jugadorActual = null
	var property juegoTerminado = false 
	
	// Nueva variable para tu lógica de 'cambiarTurno'
	var turnoJugador1 = true

	method iniciarJuego() {

		
		tablero.tableroVacio()

		listaJugadores.add(new Jugador(color = "Rojo"))
		listaJugadores.add(new Jugador(color = "Amarillo"))
		
		
		jugadorActual = listaJugadores.get(0)

		// 4. Configura los controles
		controles.configurar(self)
		
		// 5. Muestra la primera ficha (flotante)
		controles.setFicha(jugadorActual.color())
		
		// 6. Configurar teclas
		self.configurarTeclas()

		// 7. Inicia el motor del juego
		game.start()
	}
	
	// Configuración de teclas
	method configurarTeclas() {
		keyboard.left().onPressDo({ controles.moverIzquierda() })
		keyboard.right().onPressDo({ controles.moverDerecha() })
		keyboard.space().onPressDo({ controles.soltarFicha() })
	}

	method soltarFicha(columna) {
		if (juegoTerminado) { return }

		// Intenta poner la ficha en el tablero
		const fichaPuesta = tablero.soltarFicha(columna, jugadorActual.color())

		// Si la jugada fue válida (fichaPuesta no es null)
		if (fichaPuesta != null) {
			
			// ADAPTACIÓN: Llamamos al nuevo 'verificarVictoria'
			// Devuelve el color del ganador o null
			const colorGanador = tablero.verificarVictoria() 
			
			if (colorGanador != null) {
				// Si hay un ganador, es el jugador actual
				self.terminarJuego(jugadorActual) 
			} else {
				self.cambiarTurno() // Si no hay ganador, pasa el turno
			}
		}
	}

	method cambiarTurno() {
		if (turnoJugador1) { jugadorActual = listaJugadores.get(1) } else { jugadorActual = listaJugadores.get(0) }
		turnoJugador1 = not turnoJugador1 
		console.println("Turno del jugador: " + jugadorActual.color())
		controles.setFicha(jugadorActual.color())
	}
	method terminarJuego(jugadorGanador) {
		juegoTerminado = true
		controles.removerVisual()
		game.say(self, "¡Ganó el jugador " + jugadorGanador.color() + "!")
	}
}
class Jugador {

	const property color
}
