import wollok.game.*

class Maiz {

    var property position
    var property esBebe = true

    method image() {

        if(esBebe) {
            return "corn_baby.png"
        }

        return "corn_adult.png"
    }

    method regar() {
        esBebe = false
    }

	method estaListaParaCosecha() {
		return not esBebe
	}

	method valor() {
		return 150
	}
}

class Trigo {

    var property position
    var property etapa = 0

    method image() {
        return "wheat_" + etapa.toString() + ".png"
    }

    method regar() {
        if(etapa == 3) {
            etapa = 0
        }
        else {
            etapa = etapa + 1
        }
    }

	method estaListaParaCosecha() {
		return etapa >= 2
	}

	method valor() {
		return (etapa - 1) * 100
	}
}

class Tomaco {

    var property position

    method image() {
        return "tomaco.png"
    }

    method regar() {
        if(position.y() == game.height() - 1) {
            position = game.at(
                position.x(),
                0
            )
        }
        else {
            position = position.up(1)
        }
    }

	method estaListaParaCosecha() {
		return true
	}

	method valor() {
		return 80
	}
}