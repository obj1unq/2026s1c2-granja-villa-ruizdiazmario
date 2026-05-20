import wollok.game.*
import cultivos.*
import personaje.*
object granja {

    var cultivos = new List()
    var cosechados = new List()
    var mercados = new List()

    method sembrar(unCultivo) {
        cultivos.add(unCultivo)
        game.addVisual(unCultivo)
    }

    method cultivos() {
        return cultivos
    }

    method cultivosEn(unaPosicion) {
        return cultivos.filter {
            cultivo => cultivo.position() == unaPosicion
        }
    }

    method hayCultivosEn(unaPosicion) {
        return self.cultivosEn(unaPosicion).notEmpty()
    }

    method regarCultivoEn(unaPosicion) {
        const cultivosEncontrados = self.cultivosEn(unaPosicion)

        if(cultivosEncontrados.isEmpty()) {
            game.say(personaje, "no tengo nada para regar")
        }

        cultivosEncontrados.forEach {
            cultivo => cultivo.regar()
        }
    }

    method cosecharCultivosEn(unaPosicion) {
        const encontrados = self.cultivosEn(unaPosicion)

        if(encontrados.isEmpty()) {
            game.say(personaje, "no tengo nada para cosechar")
        }

        encontrados.forEach { cultivo =>
            if(cultivo.estaListaParaCosecha()) {
                cultivos.remove(cultivo)
                cosechados.add(cultivo)
                game.removeVisual(cultivo)
            }
        }
    }

    method venderTodo() {
        const mercado = self.mercadoEn(
            personaje.position()
        )

        if(mercado == null) {
            throw new DomainException(
                message = "no estás en un mercado"
            )
        }

        const total = mercado.comprar(cosechados)

        personaje.ganarOro(total)

        cosechados = new List()
    }

    method cantidadParaVender() {
        return cosechados.size()
    }

    method agregarMercado(unMercado) {
        mercados.add(unMercado)
        game.addVisual(unMercado)
    }
    
    method mercadoEn(unaPosicion) {
        const encontrados = mercados.filter {
            mercado => mercado.position() == unaPosicion
        }

        if(encontrados.isEmpty()) {
            return null
        }

        return encontrados.first()
    }
}