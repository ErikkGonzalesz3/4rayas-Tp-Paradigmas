import jugador.*
object juego{

//   var turnoJugador1 = true
    const listaJugadores = []

method iniciarJuego () {
    //acá va la lógica de responsabilidades, ir modelando el tablero, el fondo, los huecos para que las fichas vayan 
    //apareciendo, etc
    listaJugadores.add(new Jugador(color = "Rojo"))
    listaJugadores.add(new Jugador(color = "Amarillo"))



}
    method agregarJugador(_color) {
        var jugador = new Jugador (color = _color)
        jugador.configuracion(_color)
        listaJugadores.add(jugador)
    }

  method cambiarTurno(){

  }

  method victoriaVerificar(){

  }

}