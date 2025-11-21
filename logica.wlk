import wollok.game.*
import tablero.*
import utils.*


//lógica del juego
object logica {
	const casillerosLibres  = new Dictionary ()
	const columnasOcupadas = [] 


	const jugadores = [
		new Jugador (color = "rojo"), 
		new Jugador (color ="azul")
	]

	method cargarCasillerosLibres () {
		(0..6).forEach{n => 
			casillerosLibres.put(n, utils.nuevaLista(5))
		 }
	}


	method iniciarLogica() {
		self.cargarCasillerosLibres()
	}



	method estaOcupada (columna) = columnasOcupadas.contains(columna)
	method ocuparColumna(columna) {
		columnasOcupadas.add(columna)
	}
	

	
	method quiereJugar (columna) {
		if (self.estaOcupada(columna)) {
			const err = new DomainException (message = "La columna está ocupada, por favor seleccionar otra")
		}
		self.juegaTurno(self.jugadorActual(), columna)
	}

	method juegaTurno(_jugadorActual, columna) {
	
		//sino que el jugador se guarde la información acerca de la casilla que ocupó, y que delegue en algún otro lado la responsabilidad de 
		//controlar cuándo gano por medio de la verificación de combinaciones ganadores
		const fila = self.buscarFila(columna)
		_jugadorActual.guardarPosicion(columna, fila.last())
		self.ocuparFila(columna, fila)
		self.cambiarTurno()
	}


	//Dada una columna seleccionada, se va a buscar la fila libre para ocupar
	method buscarFila(columna) = casillerosLibres.get(columna)

	method ocuparFila(columna, fila) {
		fila.remove(fila.size()-1)
	}
	// method eliminarPosicion(fila) = fila.remove(fila.last())


	//manejo de turnos
	method cambiarTurno() {jugadores.reverse()} //habría que modificar las posiciones de la lista
	method jugadorActual () = jugadores.first()
}

class Jugador {

	var property color //string, NO objeto
	const casillasOcupadas = []	

	

	
	method guardarPosicion(columna, fila) {
		tablero.mostrarJugada(color, columna, fila)
		casillasOcupadas.add([columna, fila])
		//acá debería ver como guardar la posición y que algún de algún lado se delegue la responsabilidad de checkear si es ganador o no
		//a medida que pasa cada turno	
	}

}

class Color {
	var property color  
	var property position  
	method image () = color + ".png"

	// method marcarFicha(columna, fila) {
	// 	tablero.mostrarJugada(color, columna, fila)
	// }

}

