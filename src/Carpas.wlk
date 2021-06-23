import Marcas.*




class Carpa {
	var property limite = 50
	var property tieneBandaDeMusica = false
	var property marca
	const property quienesEstan = []
	var property tipoRecargo
	
	

	method cantidadPersonas() = quienesEstan.size()
	method hayLugar() = self.cantidadPersonas() < limite
	
	method registarIngreso(unaPersona){
		quienesEstan.add(unaPersona)
	}
	
	
	method puedeIngresar(persona) {
		return self.hayLugar() and not persona.estaEbria()
	}
	
	
	method servirJarra(persona, capacidadJarra){
		if (not self.quienesEstan().contains(persona) ){
			self.error("La persona no esta en la carpa")
		}
		 persona.recibirJarra(new Jarra(marca=self.marca(), capacidad=capacidadJarra, fueServidaEnCarpa=self))	
	}
	
	method ebriosEmpedernidos() =  self.quienesEstan().count { p => p.esEmpedirnido()}
	
	method homogenia() = self.quienesEstan().map({ p => p.nacionalidad()}).asSet().size() == 1
	
}
