object driver {
	var vehicle;
	
	method vehicle(newVehicle) {
		vehicle = newVehicle;
	}
	
	method driveVehicle() {
		vehicle.drive();
	}
}

object car {
	const maximum_fuel = 100;

	var fuel = maximum_fuel;
	
	method drive() {
		if (fuel > 0) {
			fuel -= 10;
		}
	}
}

object helicopter {
	const maximum_fuel = 100;

	var fuel = maximum_fuel;
	
	method drive() {
		if (fuel > 0) {
			fuel -= 25;
		}
	}
}