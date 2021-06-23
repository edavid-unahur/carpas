class Persona {
	var property peso = 80
	const property jarrasCompradas = []
	var property aguante = 50
	var property leGustaEscucharMusica = false
	
	
	method alcoholIngerido() = self.jarrasCompradas().sum { j => j.contenidoDeAlcohol() }
	
	method recibirJarra(unaJarra) {
		jarrasCompradas.add(unaJarra)
	}
	
	method esEmpedirnido() {
		return self.estaEbria() and self.jarrasCompradas().all { j => j.capacidad() >= 1}
	}
	
	method esPatriota() {
		self.jarrasCompradas().all{ j => j.marca().paisFabricacion() == self.nacionalidad()}
	}
	
	
	method estaEbria() {
		return self.alcoholIngerido() * self.peso() > self.aguante()
	}
	
	method leGustaMarcar(marca)  
	
	method nacionalidad()
	
	method quiereEntrar(carpa) {
		return self.leGustaMarcar(carpa.marca()) && self.leGustaEscucharMusica() == carpa.tieneBandaDeMusica()
	}
	
	method puedeIngresar(carpa) {
		return self.quiereEntrar(carpa) && carpa.puedeIngresar(self)
	}

	method entrar(carpa) {
		if (not self.puedeIngresar(carpa)) {
			self.error("No puede ingresar")
		}
		carpa.registarIngreso(self)
	}
	
	method marcasQueCompro() {
		return jarrasCompradas.map({ j => j.marca()}).asSet()
	}
	
	method esCompatible(unaPersona) {
		const comunes = self.marcasQueCompro().intersection(unaPersona.marcasQueCompro())
		return comunes.size() >= self.marcasQueCompro().size().min(unaPersona.marcasQueCompro().size())
	}
	
	
	method carpasDondeMeSirvieronCerveza() {
		return jarrasCompradas.map( {j => j.fueServidaEnCarpa()}).asSet()
	}


	method compreCervezaEn(unaCarpa) {
		return self.carpasDondeMeSirvieronCerveza().contains(unaCarpa)
	}

}

class Belga inherits Persona {
	override method leGustaMarcar(marca) {
		return marca.contenidoDeLupulo() > 4
	}
	
	override method nacionalidad() = "Belga"
}

class Checo inherits Persona {
	override method leGustaMarcar(marca) {
		return marca.graduacion() > 8
	}
	override method nacionalidad() = "Checo"
}

class Aleman inherits Persona {
	override method leGustaMarcar(marca) = true
	override method quiereEntrar(carpa) {
		return super(carpa) and carpa.cantidadPersonas().even()
	}
	
	override method nacionalidad() = "Aleman"
}

