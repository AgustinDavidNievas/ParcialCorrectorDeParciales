package correctorDeParciales.pregunta

abstract class Pregunta {
	
	@Property int peso
	@Property int pesoObtenido //es lo que saco el alumno al contestar
	@Property String respuestaCorrecta
	@Property String respuesta
	
	new(int peso1, String respuestaCorrecta1, String respuesta1){
		
		this.peso = peso1
		this.respuestaCorrecta = respuestaCorrecta1
		this.respuesta = respuesta1 
		this.pesoObtenido = 0
	}
	
	def void corregite()
}