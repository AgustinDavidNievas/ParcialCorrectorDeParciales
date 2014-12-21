package correctorDeParcialesTest

import correctorDeParciales.examen.Examen
import correctorDeParciales.pregunta.PreguntaSiNo
import static org.junit.Assert.*
import org.junit.Test
import correctorDeParciales.examen.ExamenPorPartes
import correctorDeParciales.pregunta.PreguntaFlexible
import java.util.List

class TestCorrectorDeParciales {
	
	@Test
	def testExamenSimpleSeCorrigeBienYEsAprobado(){
		
		val examen = new Examen()
		val pregunta = new PreguntaSiNo(10,"japon","japon")
		//peso, respuestaCorrecta, respuestaQueDioElAlumno
		
		examen.agregarPregunta(pregunta)
		
		examen.corregite
		
		assertTrue(examen.aprobado)
	}
	
	@Test
	def testExamenSimpleSeCorrigeYEsDesaprobado(){
		
		val examen = new Examen()
		val pregunta = new PreguntaSiNo(5,"japon","china")//la respuesta no es la correcta
		val pregunta2 = new PreguntaSiNo(3,"kuka","cuca")//la respuesta no es la correcta
		val pregunta3 = new PreguntaSiNo(2,"Roma","Roma")//la respuesta es la correcta, pero no llega al 60%
		
		examen.agregarPregunta(pregunta)
		examen.agregarPregunta(pregunta2)
		examen.agregarPregunta(pregunta3)
		
		examen.corregite
		
		assertFalse(examen.aprobado)
	}
	
	@Test
	def testExamenPorPartesEstaAprobadoPorqueSusPartesLoEstan(){
		
		val examen = new ExamenPorPartes
		
		val parte1 = new Examen
		val parte2 = new Examen
		
		val pregunta1 = new PreguntaSiNo(10,"juno","juno")
		val pregunta2 = new PreguntaSiNo(10,"napoleon","napoleon")
		
		parte1.agregarPregunta(pregunta1)
		parte2.agregarPregunta(pregunta2)
		
		examen.agregarParte(parte1)
		examen.agregarParte(parte2)
		
		examen.corregite
		
		assertTrue(examen.aprobado)
	}
	
	@Test
	def testExamenPorPartesEstaDesAprobadoPorqueUnaDeSusPartesLoEsta(){
		
		val examen = new ExamenPorPartes
		
		val parte1 = new Examen
		val parte2 = new Examen
		
		val pregunta1 = new PreguntaSiNo(10,"x","x")
		val pregunta2 = new PreguntaSiNo(10,"a","b")
		
		parte1.agregarPregunta(pregunta1)
		parte2.agregarPregunta(pregunta2)
		
		examen.agregarParte(parte1)
		examen.agregarParte(parte2)
		
		examen.corregite
		
		assertFalse(examen.aprobado)
	}
	
	@Test
	def testExamenConMixDePreguntasEsAprobado(){
		
		val examen = new Examen
		
		val preguntaSimple = new PreguntaSiNo(5,"DOOM","DOOM")
		
		val List<String > listaDeRespuestasAlternativas = newArrayList
		listaDeRespuestasAlternativas.add("cabra")
		val preguntaFlexible = new PreguntaFlexible(5,"bichoConMuchasPatas","cabra",4, listaDeRespuestasAlternativas)
												//(Peso,RespuestaCorrecta,RespuestaObtenida,PesoDeLasRespuestasAlternativas,RespuestasAlternativas)
		
		examen.agregarPregunta(preguntaSimple)
		examen.agregarPregunta(preguntaFlexible)
		
		examen.corregite
				
		assertTrue(examen.aprobado)
	}
	
	@Test
	def testExamenConPreguntasFlexiblesNoEstaAprobado(){
		
		val examen = new Examen
		val List<String> respuestasAlternativas = newArrayList
		respuestasAlternativas.add("heihachi")
		val preguntaFlex = new PreguntaFlexible(10,"law","heihachi",1,respuestasAlternativas)
		
		examen.agregarPregunta(preguntaFlex)
		
		examen.corregite
		
		assertFalse(examen.aprobado)
	}
	
	@Test
	def testMixDeMixDeMixesAprobado(){
		
		val examen = new ExamenPorPartes
		val examenDeExamen = new ExamenPorPartes
		
		val parte1 = new Examen
		val parte2 = new Examen
		val parte3 = new Examen
		
		val pregunta1 = new PreguntaSiNo(5,"A","A")
		val pregunta2 = new PreguntaSiNo(3,"B","B")
		val pregunta3 = new PreguntaSiNo(2,"C","C")
		
		parte1.agregarPregunta(pregunta1)
		parte2.agregarPregunta(pregunta2)
		parte3.agregarPregunta(pregunta3)
		
		examenDeExamen.agregarParte(parte1)
		examenDeExamen.agregarParte(parte2)
		
		examen.agregarParte(parte3)
		examen.agregarParte(examenDeExamen)
		
		examen.corregite
		
		assertTrue(examen.aprobado) 
	}
}