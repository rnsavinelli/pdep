class Habilidad {

	var property nivel = 1

	method nucleo() = ""

	method usarHabilidad(mutante) = { poder => return poder }

	method puedeAprenderHabilidad(mutante) = false

	override method ==(other) {
		return self.nucleo() == other.nucleo()
	}
}

class ExplosionOptica inherits Habilidad {

	override method nucleo() = "Explosion Optica"

	override method usarHabilidad(mutante) = { poder => return poder + 30 }

	override method puedeAprenderHabilidad(mutante) {
		const poderTotal = mutante.poderTotal()
		return poderTotal >= 70 && poderTotal <= 115
	}

}

class Telepatia inherits Habilidad {

	override method nucleo() = "Telepatia"

	override method usarHabilidad(mutante) = { poder => poder * 3 }

}

class Supervelocidad inherits Habilidad {

	override method nucleo() = "Supervelocidad"

	override method usarHabilidad(mutante) = { poder =>
		if (mutante.potencial().even()) {
			return poder + 20
		}
		return poder + 25
	}

	override method puedeAprenderHabilidad(mutante) {
		return mutante.potencial() <= 30
	}

}

class Transformacion inherits Habilidad {

	override method nucleo() = "Transformacion"

	override method usarHabilidad(mutante) = { poder =>
		const modificador = mutante.potencial().div(5)
		return poder - modificador
	}

	override method puedeAprenderHabilidad(mutante) {
		return mutante.poderTotal() > 60
	}

}

class Telequinesis inherits Habilidad {

	override method nucleo() = "Telequinesis"

	override method usarHabilidad(mutante) = { poder =>
		var modificador = mutante.potencial() * 3
		if (modificador < 80) {
			modificador = 80
		}
		return poder + modificador
	}

}

class Suerte inherits Habilidad {

	override method nucleo() = "Suerte"

	override method usarHabilidad(mutante) = { poder =>
		var modificador = 0
		if (mutante.nombre().size().odd()) {
			modificador = mutante.potencial() * 3
		}
		return poder + modificador
	}

	override method puedeAprenderHabilidad(mutante) {
		return mutante.poderTotal() > 45
	}

}

class AbsorcionSolar inherits Habilidad {

	override method nucleo() = "Absorcion Solar"

	override method usarHabilidad(mutante) = { poder => return poder + mutante.potencial() * mutante.cantidadDeHabilidades() }

	override method puedeAprenderHabilidad(mutante) {
		return mutante.cantidadDeHabilidades() >= 2
	}

}

class Magnetismo inherits Habilidad {

	override method nucleo() = "Magnetismo"

	override method usarHabilidad(mutante) = { poder => return poder + poder.div(2) }

	override method puedeAprenderHabilidad(mutante) {
		return mutante.potencial() >= 30 && mutante.poderTotal() > 50
	}

}

class Inamovible inherits Habilidad {

	override method nucleo() = "Inamovible"

	override method usarHabilidad(mutante) = { poder =>
		var poder_calculado = 0
		const cantidadDeHabilidades = mutante.cantidadDeHabilidades()
			// The second part of this if statement was already addressed by the method 
			// usarHabilidad(habilidad) of the Mutante class, whose instantiated objects 
			// would allegedly be the invokers of this method...
			// In this regard, if the Mutant object knows said Habilidad a double check 
			// would be performed... If it doesn't, the execution won't be allowed by
			// the Mutante itself...
			// The premise has been to not let a Mutante object use an Habilidad if it
			// does not know it.. Therefore, we commented it out.
		if (cantidadDeHabilidades == 1 /*  && mutante.habilidades().contains(self) */ ) {
			poder_calculado = 50
		} else {
			poder_calculado = poder + cantidadDeHabilidades
		}
		return poder_calculado
	}

	override method puedeAprenderHabilidad(mutante) = true

}

