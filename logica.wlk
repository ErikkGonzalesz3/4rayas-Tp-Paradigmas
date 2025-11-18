import wollok.game.*
import tablero.*
import utils.*


//lógica del juego
object logica {
	var property casillerosLibres  = new Dictionary ()
	var columnasOcupadas = [] 


	const jugadores = [
		new Jugador (color="rojo"), 
		new Jugador (color="amarillo")
	]

	method iniciarLogica() {
		
	}

	method estaOcupada (columna) = columnasOcupadas.contains(columna)
	method ocuparColumna(columna) {
		casillerosLibres.remove(columna)
		columnasOcupadas.add(columna)
	}
	

	method cargarCasillerosLibres () {
		(0..6).forEach({n => 
			casillerosLibres.put(n+1, utils.nuevaLista(6))
		 })
	}

	method quiereJugar (numero) {
		
	}

	method juegaTurno(jugadorActual, columna) {
		if (self.estaOcupada(columna)) {
			const err = new DomainException (message = "La columna está ocupada, por favor seleccionar otra")
		}
		//sino que el jugador se guarde la información acerca de la casilla que ocupó, y que delegue en algún otro lado la responsabilidad de 
		//controlar cuándo gano por medio de la verificación de combinaciones ganadores
		const fila = self.buscarFila(columna)
		self.ocuparFila(columna, fila)
		jugadorActual.guardarPosicion(columna, fila)
		self.cambiarTurno()
	}

	//Dada una columna seleccionada, se va a buscar la fila libre para ocupar
	method buscarFila(columna) = casillerosLibres.get(columna)
	method ocuparFila(columna, fila) {
		self.eliminarPosicion(fila)		
	}
	method eliminarPosicion(fila) = fila.remove(fila.last())


	//manejo de turnos
	method cambiarTurno() {}
}

class Jugador {

	var property color 
	const casillasOcupadas = []	

	

	method image () = color.toString() + "png"
	method mover (columna) {
	}
	
}


// object rojo  {
// 	method image () = "rojo.png"
// 	method marcarFicha() {game.addVisual(self)}
// }

// object amarillo  {
// 	method image () = "amarillo.png"
// 	method marcarFicha() {game.addVisual(self)}
// }


