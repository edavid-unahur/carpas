import Marcas.*

class Persona {

	var property jarrasCompradas = []
	var nivelDeAguante
	const musicaTradicional
	const peso

	method comprarCerveza(jarra) {
		jarrasCompradas.add(jarra)
	}

	method estaEbria() {
		return self.totalAlcohol() * peso > nivelDeAguante
	}

	method totalAlcohol() {
		return jarrasCompradas.sum{ jarra => jarra.cantidadAlcohol() }
	}

	method nivelDeAguante() {
		return nivelDeAguante
	}

	method escuchaMusicaTradicional() {
		return musicaTradicional
	}

	method esCervezaPreferida(cerveza) {
		return true
	}

	method quiereEntrar(carpa) {
		return self.esCervezaPreferida(carpa.marca()) and self.escuchaMusicaTradicional() == carpa.musicosTradicionales()
	}

	method puedeEntrar(carpa) {
		return self.quiereEntrar(carpa) and carpa.permitirEntrar(self)
	}

	method pais() {
		return "Indefinido"
	}

	method esPatriota() {
		return jarrasCompradas.all({ jarras => jarras.marca().pais() == self.pais() })
	}

	method esCompatible(persona) {
	}

}

class Belga inherits Persona {

	override method pais() {
		return "Belgica"
	}

	override method esCervezaPreferida(cerveza) {
		return cerveza.lupuloPorLitro() > 4
	}

}

class Checo inherits Persona {

	override method pais() {
		return "Checoslovakya"
	}

	override method esCervezaPreferida(cerveza) {
		return cerveza.graduacion() > 8
	}

}

class Aleman inherits Persona {

	override method pais() {
		return "Alemania"
	}

	// override method esCervezaPreferida(cerveza){return true} .
	// (se me hace que este override esta de mas, ya que la clase Persona de la que hereda el metodo, retorna siempre true)
	override method quiereEntrar(carpa) {
		return self.esCervezaPreferida(carpa.marca()) and self.escuchaMusicaTradicional() == carpa.musicosTradicionales() and carpa.cantidadDentroDeLaCarpa().even()
	}

}

