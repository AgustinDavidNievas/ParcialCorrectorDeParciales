package correctorDeParciales.pregunta

import java.util.List

class PreguntaFlexible extends Pregunta {
	
	@Property List<String> respuestasAlternativas //A La Correcta Que Dan Una Cantidad De Puntos != 0 
	@Property int pesoAlternativo
	
	new(int peso1, String respuestaCorrecta1, String respuesta1) {
		super(peso1, respuestaCorrecta1, respuesta1)
		this.respuestasAlternativas = newArrayList
		this.pesoAlternativo = 0
	}
	
	new(int peso1, String respuestaCorrecta1, String respuesta1, int pesoAlt, List<String> alternativas) {
		super(peso1, respuestaCorrecta1, respuesta1)
		this.respuestasAlternativas = newArrayList
		this.respuestasAlternativas = alternativas
		this.pesoAlternativo = pesoAlt
	}
	
	override corregite() {
		if(this.respuesta == this.respuestaCorrecta){
			this.pesoObtenido = this.peso
		}else{
			if(this.respuestasAlternativas.contains(this.respuesta)){
				this.pesoObtenido = this.pesoAlternativo
			}
		}
	}
	
}