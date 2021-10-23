import Marcas.*
import Personas.*

class Carpa {
	var limiteDePublico
	var musicosTradicionales
	var marca
	var personas = []
	
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
	method servirCerveza(persona, capacidad){
		const jarrita = new Jarra(marca=marca, capacidad=capacidad)
		persona.comprarCerveza(jarrita)
	}
	method cantidadEbriosEmpedernidos(){
		return personas.filter({persona => persona.jarrasCompradas().all({jarra => jarra.capacidad() >= 1})}).size()
	}
	method esHomogenea(){
		return personas.all({persona => persona.pais() == "Belgica"}) or
			   personas.all({persona => persona.pais() == "Alemania"}) or
			   personas.all({persona => persona.pais() == "Checoslovakya"})
	}
}
