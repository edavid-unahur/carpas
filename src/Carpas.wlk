import Marcas.*
import Personas.*

class Carpa {
	var limiteDePublico
	var musicosTradicionales
	var marca
	const personas = []
	var property recargo = "FIJO"
	
	method musicosTradicionales(){return musicosTradicionales}
	method limiteDePublico(){return limiteDePublico}
	method marca(){return marca}
	method cantidadDentroDeLaCarpa(){return personas.size()}
	
	method permitirEntrar(persona){
		return not persona.estaEbria() and 
			   personas.size() + 1 <= limiteDePublico
		}
		
	method ingresar(persona){
		if (persona.puedeEntrar(self)){
			personas.add(persona)
		} else{
			self.error("No pudo ingresar.")
		}
	}
	
	method precio(){
		return marca.precioPorLitro() * self.recargo()
	}
	
	method recargo() {
		return if (recargo.toUpperCase() == "FIJO") {
			self.recargoFijo()
		} else if (recargo.toUpperCase() == "EBRIEDAD") {
			self.recargoEbriedad()
		} else if (recargo.toUpperCase() == "CANTIDAD") {
			self.recargoCantidad()
		} 
	}
	
	method recargoEbriedad(){
		return if (personas.count({persona => persona.estaEbria()}) > limiteDePublico * 0.75){
			   0.5
		} else {
			   0.2
		}
	}
	
	method recargoFijo() {return 0.3}
	
	method recargoCantidad(){
		return if (personas.size() > limiteDePublico/2){
			   0.4
		} else {
			   0.25
		}
	}
	method servirCerveza(persona, capacidadDeJarra){
		
		const jarrita = new Jarra(capacidad = capacidadDeJarra, marca = marca, carpa = self)
		
		if(personas.contains(persona)){
		  persona.comprarCerveza(jarrita)
		}
		else self.error("la persona no esta dentro de la carpa")
	}
	
	method cantidadEbriosEmpedernidos(){
		return personas.filter({persona => persona.jarrasCompradas().all({jarra => jarra.capacidad() >= 1})}).size()
	}
	
	method esHomogenea(){
		return personas.all({persona => persona.pais() == "Belgica"}) or
			   personas.all({persona => persona.pais() == "Alemania"}) or
			   personas.all({persona => persona.pais() == "Checoslovakya"})
	}
	
	method asistentesSinCerveza(){
		return personas.filter({persona => persona.jarrasCompradas().all({jarra => jarra.carpa() != self})})
	}
}


