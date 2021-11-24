class OutOfDineroException inherits Exception {
	const property jugador
	const property equipamiento
}

class Enfrentamiento {
	var property partida = 0
	const property terrorists = #{}
	const property counterTerrorists = #{}
	
	/* Punto 5 */
	/* se asume que la cantidad de compras va a ser igual a la cantidad de jugadores, y que las
	 * mismas podrán ser realizadas. */
	method realizarCompras(comprasTerrorists, comprasCounterTerrorists) {
		terrorists.forEach({ terrorist =>
			const equipamiento = comprasTerrorists.first()
			terrorist.adquirirEquipamiento(equipamiento)
			comprasTerrorists.remove(equipamiento)
		})
		
		counterTerrorists.forEach({ counterTerrorist =>
			const equipamiento = comprasCounterTerrorists.first()
			counterTerrorist.adquirirEquipamiento(equipamiento)
			comprasCounterTerrorists.remove(equipamiento)
		})		
	}
	
	/* Punto 4 */
	/* El estado anterior pertenece al avatar previo de cada jugador, ya que
	 * el avatar del jugador es distinto por cada partida. Es es, a partir del
	 * estado del avatar anterior, se crea el nuevo (valga la redundancia).
	 */
	method nuevaPartida() {
		/* Si existe una partida anterior, el nuevo estado se construye a partir del viejo */
		/* para la partida cero ya vienen los avatares pre-creados con el jugador */
		terrorists.forEach({ terrorist => terrorist.nuevoAvatar() })
		counterTerrorists.forEach({ counterTerrorist => counterTerrorist.nuevoAvatar() })		

		self.partida(self.partida() + 1)		
	}
	
	/* Punto 2 - Conocer al MVP (most valuable player) del enfrentamiento, que es aquel que tiene mayor eficiencia. */
	method mvp() {
		const jugadores = []
		
		jugadores.addAll(terrorists)
		jugadores.addAll(counterTerrorists)
		
		return jugadores.max({ jugador => jugador.eficiencia() })
	}         		
}

class Equipamiento {		
	const property costo = 0
}

object armaReglamentaria inherits Equipamiento {
	override method costo() = 0
}
 
class Avatar {
	var property survived = true
	var property historialDeKills = #{}
	var property equipamiento = armaReglamentaria
	var property dinero = 800
}
 
class Jugador {
	var property nickname = "bot"
	
	var property avatar = new Avatar()	
	
	var property kills = 0
	var property deaths = 0
	
	const historialDeCompras = []
	
	/* Punto 1 */
	method eficiencia() {
		return (self.kills() - self.deaths()).max(0)
	}
	
	/* Punto 6 */	
	method dineroGastado() = historialDeCompras.sum({equipamiento => equipamiento.costo()})
	
	/* Punto 3 */
	method adquirirEquipamiento(nuevoEquipamiento) {
		if(nuevoEquipamiento.costo() <= self.avatar().dinero()) {
			self.avatar().dinero(self.avatar().dinero() - nuevoEquipamiento.costo())
			self.avatar().equipamiento(nuevoEquipamiento)
			historialDeCompras.add(nuevoEquipamiento)
		}
		else {
			throw new OutOfDineroException(jugador=self, equipamiento=nuevoEquipamiento, message="El jugador no puede comprar este equipamiento")
		}
	}	
	
	method nuevoAvatar() {
		self.kills(self.kills() + self.avatar().historialDeKills().size())

		const newAvatar = new Avatar()
		
		if(self.avatar().survived()) {
			newAvatar.equipamiento(self.avatar().equipamiento())
		}
		else {
			self.deaths(self.deaths() + 1)
		}
		
		newAvatar.dinero((self.avatar().dinero() + (self.eficiencia() * 800).min(3500).max(800)))
		
		self.avatar(newAvatar)
	}
}
