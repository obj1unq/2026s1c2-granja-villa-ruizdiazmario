import wollok.game.*

object personaje {

    var property position = game.center()
    const property image = "fplayer.png"
	var property oro = 0

    method mover(direccion) {
        position = direccion.siguiente(position)
    }

	method ganarOro(cantidad) {
		oro = oro + cantidad
	}
}