class Empresa {
	var property profesionalesContratados
	var property honorario
	var clientes
	
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
	
	method puedeSatisfacerA(solicitante){
		return profesionalesContratados.any({profesional => solicitante.puedeSerAtendidoPor(profesional)})
	}
	
	method darServicio(solicitante){
		if(self.puedeSatisfacerA(solicitante)){
			self.profesionalQueSatisfaceA(solicitante).cobrar(self.profesionalQueSatisfaceA(solicitante).honorariosPorHora())
			clientes.add(solicitante)
		}
		else{
			throw ("ERROR")
		}
	}
	
	method profesionalQueSatisfaceA(solicitante){
		return profesionalesContratados.find({profesional => solicitante.puedeSerAtendidoPor(profesional)})
	}
	
	method CantClientes(){
		clientes.size()
	}
	
	method tieneComoClienteA(solicitante){
		return clientes.any({cliente => cliente == solicitante})
	}
}
