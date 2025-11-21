
import logica.*
object utils {
	method nuevaLista(size) {
        const lista = []
        (0..size).forEach{ n => lista.add(n)}
        return lista
    }     

    method matrizVacia() {
        const matriz = []
        (0..5).forEach { fila =>
            const filaActual = []
            (0..6).forEach { col =>
                filaActual.add(0)   
            }
            matriz.add(filaActual)
        }
        return matriz
    }

    method obtenerFilaMatriz (fila, matriz) = matriz.get(fila)
    method obtenerColumna(columna, matriz) {
        const lista = []
            matriz.forEach { fila =>
                lista.add(fila.get(columna))
            }
        return lista
    }


}

object combinacionesGanadoras {
    const ganadoras = []

    method generarCombinacionesGanadoras() {
        // horizontal.generarCombinaciones(ganadoras)
        // vertical.generarCombinaciones(ganadoras)
        // diagonales.generarCombinaciones(ganadoras)
        // return ganadoras
    }

    method verificarCombinacion(){
    }
}

class Trayectoria {
    // var size = 0
    // var tail = 0
    // var f = [] 
    var hay4 = false
    var actual = 0

    method esCombinacion(columna, fila, matriz) 
    method hayCuatroEnLinea(lista) {
        lista.forEach{n => 
                if (n == 1 ) {
                    actual +=1
                    if (actual == 4 ) hay4 = true
                } else {
                    actual = 0 
                }
        }
        return hay4
    }
}

object horizontal inherits Trayectoria {

   override method esCombinacion (columna, fila, matriz) {
        const f = utils.obtenerFilaMatriz(fila, matriz)
        return self.hayCuatroEnLinea(f)
    }
}
object vertical inherits Trayectoria {
    override method esCombinacion (columna, fila, matriz) {
        const c = utils.obtenerColumna(columna, matriz)
        return self.hayCuatroEnLinea(c)        
    }
}

object diagonales inherits Trayectoria{
    override method esCombinacion (columna, fila, matriz) {
            
    }
}