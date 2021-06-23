object graduacionReglamentaria {
	var property graduacion = 5
}

class MarcaDeCerveza {
	const property contenidoDeLupulo 
	const property paisFabricacion 
	
	method graduacion()
}

class Rubia inherits MarcaDeCerveza {
	const property graduacion
}

class Negra inherits MarcaDeCerveza {
	override method graduacion() = graduacionReglamentaria.graduacion().min( self.contenidoDeLupulo() * 2 )
}

class Roja  inherits Negra {
	override method graduacion() = super() * 1.25
}


class Jarra {
	const property capacidad = 1
	const property marca 
	const property fueServidaEnCarpa 
	
	method contenidoDeAlcohol() = (self.marca().graduacion() * self.capacidad()) * 0.01
}
