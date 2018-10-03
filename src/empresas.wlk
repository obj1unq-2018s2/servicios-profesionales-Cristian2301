class Empresa {
	var property profesionalesContratados
	var property honorario
	
	method profesionalesCaros(){
		return profesionalesContratados.filter({profesional => profesional.honorariosPorHora() > self.honorario()})
	}
	
	method universidadesFormadoras(){
		return profesionalesContratados.map({profesional => profesional.universidad()}).asSet()
	}
	
	method profesionalMasBarato(){
		return profesionalesContratados.min({profesional => profesional.honorariosPorHora()})
	}
	
	method provinciaCubierta(provincia){
		return profesionalesContratados.any({profesional => profesional.provinciasDondePuedeTrabajar().contains(provincia)})
	}
	
	method cantidadDeprofesionalesQueEstudiaronEn(universidad){
		return profesionalesContratados.count({profesional => profesional.universidad() == universidad})
	}
}
