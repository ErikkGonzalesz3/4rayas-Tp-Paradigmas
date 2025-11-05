import wollok.game.*
import example.*
import juego.* 

class Tablero {
	var tablero = [] 

	
	method tableroVacio() {
		for (var i = 0; i < FILAS; i++) {
			var fila = []
			for (var j = 0; j < COLUMNAS; j++) {
				fila.add(null)
			}
			self.tablero.add(fila)
		}
	}

	
	method soltarFicha(columna, color) {
		
		const filaLogica = self.buscarFila(columna)
		
		if (filaLogica != null) {
			
			const filaVisual = (filas - 1) - filaLogica 
			const nuevaFicha = new Ficha(color = color, posicion = game.at(columna, filaVisual))
			self.tablero.get(filaLogica).set(columna, nuevaFicha)
		
			game.addVisual(nuevaFicha)
			return nuevaFicha
		}
		
		return null 
	}

	method buscarFila(columna) {
		for (var fila = FILAS - 1; fila >= 0; fila--) { 
			if (self.tablero.get(fila).get(columna) == null) {
				return fila 
			}
		}
		return null // Columna llena
	}

	method obtenerFicha(fila, columna) {
		return self.tablero.get(fila).get(columna)
	}
	
	method verificarVictoria() {
		
		for (var fila = 0; fila < 6; fila++) {
			for (var columna = 0; columna < 7; columna++) {
				
				var ficha = self.obtenerFicha(fila, columna)
				if (ficha != null) {
					if (columna <= 3 && self.verificarHorizontal(fila, columna, ficha)) {
						return ficha.color 
					}
					if (fila <= 2 && self.verificarVertical(fila, columna, ficha)) {
						return ficha.color
					}
					if (fila <= 2 && columna <= 3 && self.verificarDiagonalAscendente(fila, columna, ficha)) {
						return ficha.color
					}
					if (fila >= 3 && columna <= 3 && self.verificarDiagonalDescendente(fila, columna, ficha)) {
						return ficha.color
					}
				}
			}
		}
		return null 
	}
	
	method verificarHorizontal(fila, columna, ficha) {
		for (var i = 0; i < 4; i++) {
			if (self.obtenerFicha(fila, columna + i) == null || 
				self.obtenerFicha(fila, columna + i).color != ficha.color) {
				return false
			}
		}
		return true
	}

	method verificarVertical(fila, columna, ficha) {
		for (var i = 0; i < 4; i++) {
			if (self.obtenerFicha(fila + i, columna) == null || 
				self.obtenerFicha(fila + i, columna).color != ficha.color) {
				return false
			}
		}
		return true
	}

	method verificarDiagonalAscendente(fila, columna, ficha) {
		for (var i = 0; i < 4; i++) { 
            if (self.obtenerFicha(fila + i, columna + i) == null || self.obtenerFicha(fila + i, columna + i).color != ficha.color) {return false }
		}
		return true
	}

	method verificarDiagonalDescendente(fila, columna, ficha) {
		for (var i = 0; i < 4; i++) {
			if (self.obtenerFicha(fila - i, columna + i) == null ||self.obtenerFicha(fila - i, columna + i).color != ficha.color) {return false}
		}
		return true
	}
}
