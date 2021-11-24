import habilidades.*
import exceptions.*

class Mutante {
	var property nombre = "";
	var property potencial = 0;
	var property habilidades = #{};

	method cantidadDeHabilidades() = habilidades.size();

	method poderTotal() = habilidades.fold(potencial, {poderTotal, habilidad => self.usarHabilidad(habilidad).apply(poderTotal)});

	method aprender(habilidad) {
		if(!habilidad.puedeAprenderHabilidad(self)) {
			throw new AprenderHabilidadException(mutante=self, habilidad=habilidad, message=self.nombre() + " no puede apreneder esta habilidad de nucleo " + habilidad.nucleo())
		}
		self.habilidades(self.habilidades() + #{habilidad});		
	}

	method usarHabilidad(habilidad) {
		 if(habilidades.contains(habilidad)) {
		 	return habilidad.usarHabilidad(self);
		 }
		 return null;
	 }
	 
	method entrenar(duracion) {
		potencial = potencial + duracion;
	}
	
}
