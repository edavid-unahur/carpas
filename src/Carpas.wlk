import Marcas.*
import Personas.*

class Carpa {
	var limiteDePublico
	var musicosTradicionales
	var marca
	const personas = []
	
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
	method servirCerveza(persona, capacidadDeJarra){
		
		const jarrita = new Jarra(capacidad = capacidadDeJarra, marca = marca)
		
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
}
