import wollok.game.*

//cosas visuales + tablero
object tablero {
	const property image = "tableroRojo.png"
	const property position = game.origin()

	const columnasTablero = [] // lista de 7 elementos

	method generarFilas (columna) {
		const filas = []
		return (0..5).forEach({fila => filas.add(game.at(columna*3, fila*3))})
	}

	method cargarPosiciones() {
		(0..6).forEach({ col =>
			const filas = self.generarFilas(col)
			columnasTablero.add(filas)
		})
	}
	
	
	method iniciarTablero () {
	/*CONFIGURACIONES DEL TABLERO*/
		self.cargarPosiciones()
		game.addVisual(self)
	}





	
}

