package correctorDeParciales.examen

import java.util.List

class ExamenPorPartes extends Parte {
	
	@Property List<Parte> partes
	
	new(){
		super()
		this.aprobado = false
		this.partes = newArrayList
	}
	
	def agregarParte(Parte parte){
		this.partes.add(parte)
	}
	
	override corregite(){
		this.partes.forEach(examen|examen.corregite)
		
		this.aprobado = this.partes.forall[parte|parte.aprobado]
	}
}