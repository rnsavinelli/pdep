import mutantes.*
import habilidades.*

class Entrenamiento {
	var property duracion = 0;
	var property mutantes = #{};
	var property nucleos = #{};

	method entrenamientoBasico() {
		self.mutantes().forEach({mutante =>
			mutante.potencial(mutante.potencial() + duracion);
		});
	}

	method entrenamientoCompleto() {
		self.entrenamientoBasico();
		
		self.mutantes().forEach({mutante =>		
			mutante.habilidades().forEach({habilidad => 
				if(nucleos.contains(habilidad.nucleo())) {
					habilidad.nivel(habilidad.nivel() + 2);
				}
			});
		});		
	}
}