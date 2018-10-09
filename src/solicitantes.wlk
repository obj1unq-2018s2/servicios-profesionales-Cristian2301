class Persona {
	var property provincia
	
	method puedeSerAtendidoPor(profesional){
		return profesional.provinciasDondePuedeTrabajar().any({provinciaDondePuedeTrabajar => provinciaDondePuedeTrabajar == provincia})
	}
}

class Institucion{
	var property universidades
	
	method puedeSerAtendidoPor(profesional){
		return self.universidades().any({universidad => universidad == profesional.universidad()})
	}
	
}


