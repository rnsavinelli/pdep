/** First Wollok example */
object empleado{
	var sueldo
	var puesto = cadete
	var diasAusente
	
	method sueldo() {
		sueldo = puesto.neto()
		
		return sueldo
	}
	
	method puesto() = puesto
}

object gerente {
	
	method neto() {
		return 5000
	}
}

object cadete {
	
	method neto() {
		return 1500
	}
}