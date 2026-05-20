import wollok.game.*
import granja.*

class Aspersor {

    var property position

    method image() {
        return "aspersor.png"
    }

    method activar() {
        self.regarAutomaticamente()
    }

    method regarAutomaticamente() {
        game.schedule(1000, {
            self.regarAlrededor()
            self.regarAutomaticamente()
        })
    }

    method regarAlrededor() {

        self.posicionesAlrededor().forEach { posicion =>
            granja.cultivosEn(posicion).forEach { cultivo =>
                cultivo.regar()
            }
        }
    }

    method posicionesAlrededor() {
        return [
            position.up(1),
            position.down(1),
            position.left(1),
            position.right(1)
        ]
    }
}