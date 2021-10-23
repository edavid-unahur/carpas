class MarcaDeCerveza {
	var lupuloPorLitro
	var pais
	
	method lupuloPorLitro(){return lupuloPorLitro}
	method pais(){return pais}
	method graduacion() {return 1}
}

class CervezaRubia inherits MarcaDeCerveza{
	var graduacion
	
	override method graduacion() {return graduacion}
}

class CervezaNegra inherits MarcaDeCerveza{
	var graduacionReglamentaria
	
	override method graduacion() {
		return [lupuloPorLitro * 2, graduacionReglamentaria].min()
	}
}

class CervezaRoja inherits MarcaDeCerveza{
	var graduacionReglamentaria
	
	override method graduacion() {
		return [lupuloPorLitro * 2, graduacionReglamentaria].min() * 1.25
	}
}

class Jarra {
	var capacidad
	var marca
	
	method capacidad(){return capacidad}
	method marca(){return marca}
	method cantidadAlcohol(){return capacidad * (marca.graduacion()/100)}
}

