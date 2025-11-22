
import logica.*
import wollok.game.*
object utils {
	method nuevaLista(size) {
        const lista = []
        (0..size).forEach{ n => lista.add(n)}
        return lista
    }     

    method listVacia(size) {
        const lista = []
        (0..size).forEach{_ => lista.add(0)}
        return lista
    }
    
    method obtenerFilaMatriz (fila, matriz) = matriz.get(fila)

    method obtenerColumna(columna, matriz) {
        const lista = []
            (0..5).forEach { fila =>
                const f = matriz.get(fila)
                lista.add(f.get(columna))
            }
        return lista
    }
}

object verificador {
    method verificarAlgunaCombinacion (columna, fila, matriz) = horizontal.esCombinacion(columna, fila, matriz) or vertical.esCombinacion(columna, fila, matriz) or diagonales.esCombinacion(columna, fila, matriz)
} 

class Trayectoria {
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
        const f = matriz.get(columna)
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
        return false  //implementar
    }
}