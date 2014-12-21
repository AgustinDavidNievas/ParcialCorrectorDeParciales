package correctorDeParciales.examen

import correctorDeParciales.pregunta.Pregunta
import java.util.List

class Examen extends Parte {
	
	@Property List<Pregunta> preguntas
	
	
	new(){
		super()
		preguntas = newArrayList
		this.aprobado = false
	}
	
	def agregarPregunta(Pregunta pregunta){
		this.preguntas.add(pregunta)
	}
	
	override corregite() {
		
		this.preguntas.forEach(pregunta|pregunta.corregite)
		
		var listaPuntosObtenidos = this.preguntas.map(pregunta|pregunta.pesoObtenido).toList
		var listaDePuntosTotales = this.preguntas.map(pregunta|pregunta.peso).toList
		
		var int puntosObtenidos = 0
		var int puntosTotales = 0
		
		puntosObtenidos = this.contarPuntos(listaPuntosObtenidos, puntosObtenidos)
		puntosTotales = this.contarPuntos(listaDePuntosTotales,puntosTotales)
		
		
		if(((puntosObtenidos*100/puntosTotales))/*Paso a porcentaje*/ >= 60 /*Porciento*/){
			this.aprobado = true
		}
     }
     
     def contarPuntos(List<Integer> l, int puntos){
     	var int i = 0
     	var int p = puntos
     	//extraño el sum de smalltalk
     	while(i < l.length){
     		p = p + l.get(i)
     		i = i + 1
     	}
     	
     	return p 
     }
	
	
		
		
	
	
}