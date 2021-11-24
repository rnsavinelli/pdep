import mutantes.*
import habilidades.*
import entrenamientos.*
 
class Faccion {
	var property nombre = ""
	var property mutantes = #{};

	/* entrenamiento completo */
	method entrenamiento(duracion, nucleos) {
		const sesion = new Entrenamiento(duracion = duracion, mutantes = self.mutantes(), nucleos = nucleos);
			
		sesion.entrenamientoCompleto();
	}
	
	/* entreamiento básico */
	method entrenamiento(duracion) {
		self.entrenamiento(duracion, #{});
	}
	
	method nucleos() {
		const nucleosDistintos = #{};
		
		mutantes.forEach({ mutante =>
			mutante.habilidades().forEach({ habilidad =>
				nucleosDistintos.add(habilidad.nucleo());
			}); 
		});		
		
		return nucleosDistintos;
	}
	
	method agregarMutante(mutante) = mutantes.add(mutante);
	
	method quitarMutante(mutante) {
		if (mutantes.contains(mutante)) { 
			mutantes.remove(mutante);
		}
	}
	
	method mutantesEnComun(faccion) {
		const mutantesEnComun = #{};
		
		mutantes.forEach({mutante =>
			if(faccion.mutantes().contains(mutante)) {
				mutantesEnComun.add(mutante);
			}
		});
		
		return mutantesEnComun;
	}
	
	method cantidadDeMutantes() = mutantes.size();
	
	/* habilidades de los mutantes de la faccion */
	method habilidades() {
		const habilidades = #{};
		
		mutantes.forEach({mutante => 
			mutante.habilidades().forEach({habilidad => 
				if(!habilidades.contains(habilidad))	
					habilidades.add(habilidad);
			});
		});	
		
		return habilidades;	
	}
	
	/*  habilidades de los mutantes de la faccion según núcleo */
	method habilidades(nucleo) {
		return self.habilidades().filter({habilidad =>
			habilidad.nucleo() == nucleo
		});
	}
	
	method poderTotal() {
		var poderTotal = 0;
		
		const poderParcial = mutantes.map({mutante => mutante.poderTotal()}).sum();
		const multiplicador = self.nucleos().size();
		const cantidadDeMutantes = self.cantidadDeMutantes();
		
		if (multiplicador > cantidadDeMutantes) {
			poderTotal = poderParcial * cantidadDeMutantes;
		}
		
		else { 
			poderTotal = poderParcial * multiplicador;
		}
		
		return poderTotal; 
	}
	
	method convieneAgregarA(mutante) { 
		var conveniencia = false;
		
		mutante.habilidades().forEach({ habilidad =>			
			const nucleo = habilidad.nucleo();
			
			if(!self.nucleos().contains(nucleo)) { 
				conveniencia = true;
			}
			
			else {
				const habilidadesSegunNucleo = self.habilidades(nucleo);
	
				habilidadesSegunNucleo.forEach({ habilidadSegunNucleo => 
					if (habilidad.nivel() > habilidadSegunNucleo.nivel())
						conveniencia = true;
	 			});
 			} 			
		});
		
		return conveniencia;
	}

}