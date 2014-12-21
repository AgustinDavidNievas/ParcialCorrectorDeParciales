package correctorDeParciales.examen

import correctorDeParciales.pregunta.Pregunta
import java.util.List

class Examen extends Parte {
	
	@Property List<Pregunta> preguntas
	@Property int puntosTotales
	
	new(){
		super()
		preguntas = newArrayList
		this.puntosTotales = 0
		this.aprobado = false
	}
	
	def agregarPregunta(Pregunta pregunta){
		this.preguntas.add(pregunta)
		this.puntosTotales = this.puntosTotales + pregunta.peso
	}
	
	override corregite() {
		
		this.preguntas.forEach(pregunta|pregunta.corregite)
		
		var listaPuntosObtenidos = this.preguntas.map(pregunta|pregunta.pesoObtenido).toList
		//calcular la suma
		
		var int puntosObtenidos = 0
		
		var int i = 0
		
		while(i < listaPuntosObtenidos.length){
			//extraño el sum de smalltalk
			puntosObtenidos = puntosObtenidos + listaPuntosObtenidos.get(i)
			i = i + 1
		}
		
		if(((puntosObtenidos*100/this.puntosTotales))/*Paso a porcentaje*/ >= 60 /*Porciento*/){
			this.aprobado = true
		}
     }
	
	
		
		
	
	
}