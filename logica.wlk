import wollok.game.*
import tablero.*
import utils.*

//lógica del juego
object logica {
	const casillerosLibres  = new Dictionary ()
	const columnasOcupadas = [] 

	var jugadores = [
		new Jugador (color = "rojo"), 
		new Jugador (color ="azul")
	]

	
	method iniciarLogica() {
		self.cargarCasillerosLibres()
		jugadores.forEach{j => j.cargarPosiciones()}
	}


	method cargarCasillerosLibres () {
		(0..6).forEach{n => 
			casillerosLibres.put(n, utils.nuevaLista(5))
		}
	}
	method estaOcupada (columna) = columnasOcupadas.contains(columna)
	method ocuparColumna(columna) {
		columnasOcupadas.add(columna)
	}
	
	//Dada una columna seleccionada, se va a buscar la fila libre para ocupar
	method buscarFila(columna) = casillerosLibres.get(columna)
	method ocuparFila(columna, fila) {
		fila.remove(fila.size()-1)
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


	//manejo de turnos
	method cambiarTurno() {
		jugadores = jugadores.reverse()
	} //habría que modificar las posiciones de la lista
	method jugadorActual () = jugadores.first()

	//limpia el estado interno de la lógica del juego, en caso de que el juego tenga un ganador 
	method limpiar () {
		casillerosLibres.clear()
		columnasOcupadas.clear()
	}

	method volverAJugar () {
		self.limpiar()
		jugadores.forEach{j => j.limpiar()}
		tablero.volverAJugar()
	}

}

class Jugador{
	var property color //string, NO objeto
	const posicionesOcupadas  = new Dictionary ()

	method cargarPosiciones() {
			(0..6).forEach{n => 
			posicionesOcupadas.put(n, utils.listVacia(5)) //lista de 0 
	}}

	method guardarPosicion(columna, fila) {
		tablero.mostrarJugada(color, columna, fila)
		self.setearPosicionEnDiccionario(columna, fila)
		//acá debería ver como guardar la posición y que algún de algún lado se delegue la responsabilidad de checkear si es ganador o no
		//a medida que pasa cada turno	
	}
	method setearPosicionEnDiccionario(columna, fila) {
		const listaVieja = posicionesOcupadas.get(columna)
		const nuevaLista = []
			(0..listaVieja.size() - 1).forEach { i =>
				if (i == fila) {
					nuevaLista.add(1)
				} else {
					nuevaLista.add(listaVieja.get(i))
				}
			}
		posicionesOcupadas.put(columna, nuevaLista)
	}
	

	
	//limpia el estado interno de un jugador, el diccionario de posiciones ocupadas
	method limpiar() {
		posicionesOcupadas.clear()
	}
}

class Color {
	var property color  
	var property position  
	method image () = color + ".png"
}

