object owner {
	var bird;
	
	method tellBirdToWalk() {
		bird.walk()
	}
	
	method tellBirdToFly() {
		bird.fly()
	}

	method tellBirdToRest() {
		bird.rest()
	}
	
	method bird(_bird) {
		_bird.owner(self);
		bird = _bird;
	}
}

object bird {
	const maximum_energy = 100;
	
	var energy = maximum_energy;
	var owner;
	
	method fly() {
		if (energy > 0){
			energy = energy - 10;
		}
	}

	method walk() {
		if (energy > 0){
			energy = energy - 5;
		}
	}

	method rest() {
		energy += 25;
		
		if (energy > maximum_energy) {
			energy = maximum_energy;
		}
	}
	
	method owner(_owner) {
		owner = _owner;
	}
	
	method get_owner() {
		return owner;
	}
}
