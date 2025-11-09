import wollok.game.*


class Tablero {
	const property image = "tableroRojo.png"
	const property position = game.origin()
	const posicionesTablero = []
	const posicionesOcupadas = []


	method cargarPosiciones() {
		(0..6).forEach({ col =>
			(0..5).forEach({ fila =>
				posicionesTablero.add(game.at(col * 3, fila * 3))
			})
		})
	}


	method iniciarTablero () {
	/*CONFIGURACIONES DEL TABLERO*/
		self.cargarPosiciones()
		game.addVisual(self)
	}


	//si está ocupada la posición  
	method estaOcupada (col) = (0..6).forEach({})
	//marca a un casillero una vez que un jugador tira la ficha en alguna de las 7 columnas
	method marcarCasillero(col, fila) {
		if(!self.estaOcupada(col)) {
			posicionesOcupadas.add(game.at(col*3, fila*3))
		}
		else {
			throw new DomainException(message = "Está ocupada la casiilla!")		
		}
	}

	
}

