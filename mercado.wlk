import wollok.game.*
import personaje.*
import cultivos.*
import granja.*
import direcciones.*
import aspersor.*
class Mercado {

    var property position
    var property monedas
    var property mercaderia = new List()

    method image() {
        return "market.png"
    }

    method puedeComprar(cantidad) {
        return monedas >= cantidad
    }

    method comprar(cultivos) {
        const total = cultivos.sum {
            cultivo => cultivo.valor()
        }

        if(not self.puedeComprar(total)) {
            throw new DomainException(
                message = "el mercado no tiene dinero suficiente"
            )
        }

        monedas = monedas - total

        mercaderia.addAll(cultivos)

        return total
    }
}   