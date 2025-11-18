
object utils {
	method nuevaLista(size) {
    var lista = []
		(1..size).forEach({ n => 
			lista.add(n)
		})
		return lista
	}      


}

object combinacionesGanadoras {
    const ganadoras = []

    method generarCombinacionesGanadoras() {
        horizontal.generarCombinaciones(ganadoras)
        vertical.generarCombinaciones(ganadoras)
        diagonales.generarCombinaciones(ganadoras)
        return ganadoras
    }

    method verificarCombinacion(){
        
    }
}


object horizontal {
    method generarCombinaciones(lista) {
    (0..5).forEach({ fila =>
        (0..3).forEach({ col =>
            lista.add([
                game.at(col, fila),
                game.at(col+1, fila),
                game.at(col+2, fila),
                game.at(col+3, fila)
            ])
        })
    })
    }
}
object vertical {
    method generarCombinaciones(lista) {
 // VERTICALES
    // -----------------------------
        (0..6).forEach({ col =>
            (0..2).forEach({ fila =>
                lista.add([
                    game.at(col, fila),
                    game.at(col, fila+1),
                    game.at(col, fila+2),
                    game.at(col, fila+3)
                ])
            })
        })
    }
}

object diagonales {
    method generarCombinaciones(lista) {

    // DIAGONALES ↘ (abajo-derecha)
    // -----------------------------
    (0..3).forEach({ col =>
        (0..2).forEach({ fila =>
            lista.add([
                game.at(col, fila),
                game.at(col+1, fila+1),
                game.at(col+2, fila+2),
                game.at(col+3, fila+3)
            ])
        })
    })

    // -----------------------------
    // DIAGONALES ↗ (arriba-derecha)
    // -----------------------------
    (0..3).forEach({ col =>
        (3..5).forEach({ fila =>
            lista.add([
                game.at(col, fila),
                game.at(col+1, fila-1),
                game.at(col+2, fila-2),
                game.at(col+3, fila-3)
            ])
        })
    })
    }
}