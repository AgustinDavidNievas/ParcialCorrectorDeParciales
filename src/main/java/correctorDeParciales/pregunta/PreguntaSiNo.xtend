package correctorDeParciales.pregunta

class PreguntaSiNo extends Pregunta {

	new(int peso1, String respuestaCorrecta1, String respuesta1) {
		super(peso1, respuestaCorrecta1, respuesta1)
	}

	override corregite() {
		if (this.respuesta == this.respuestaCorrecta) {
			this.pesoObtenido = this.peso
		}//else pesoObtenido = 0 (el pesoObtenido se inicializa en 0)
	}

}
