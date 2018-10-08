import universidades.*
import asociacion.*

// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	// TODO Asociación es un objeto global, no hace falta tenerlo como variable, podrías hablarle directamente.
	// O si querés la referencia tenés que inicializar.a
	var asociacion
	
	method universidad() { 
		return universidad
	}
	method universidad(univ) { 
		universidad = univ
	}
	
	method provinciasDondePuedeTrabajar() { 
		return #{"Entre Ríos", "Corrientes", "Santa Fe"}	
	}
	
	method honorariosPorHora() { 
		return 3000
	}
	
	method cobrar(dineroNuevo){
		asociacion.recibirDinero(dineroNuevo)
	}
}

// a esta clase le faltan métodos
class ProfesionalVinculado {
	var universidad
	
	method universidad() { 
		return universidad
	}
	method universidad(univ) { 
		universidad = univ
	}
	
	method provinciasDondePuedeTrabajar(){
		return #{self.universidad().provincia()}
	}
	
	method honorariosPorHora(){
		return self.universidad().honorariosRecomendados()
	}
	
	method cobrar(dineroNuevo){
		universidad.donar(dineroNuevo / 2)
	}
	
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var universidad
	var property provinciasDondePuedeTrabajar
	var property honorariosPorHora
	var totalCobrado = 0
	
	method universidad() { 
		return universidad
	}
	
	method universidad(univ) { 
		universidad = univ
	}
	
	method cobrar(dineroNuevo){
		totalCobrado += dineroNuevo
	}
	
	method pasarDinero(profesional, cantDinero){
		profesional.cobrar(cantDinero)
		totalCobrado -= cantDinero
	}
}






