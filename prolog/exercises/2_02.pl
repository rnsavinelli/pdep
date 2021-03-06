%Ahora queremos saber qué empleados pueden servir para un sector dado.

%Sabiendo que la base de conocimiento contiene hechos de la forma:

% * contador/1, honesto/1, ambicioso/1
% * trabajoEn/2: nos dice si un empleado trabajó antes en cierto lugar.

%Desarrollá un predicado puedeAndar/2 que relaciona a un sector con un empleado si este puede trabajar allí. Considerar que:

% * en contaduria solo pueden trabajar contadores honestos
% * en ventas solo pueden trabajar ambiciosos que tienen experiencia (gente que haya trabajado en algun lugar antes)
% * y lucia siempre puede trabajar en ventas

puedeAndar(contaduria, Empleado) :-
  contador(Empleado), honesto(Empleado).

tieneExperiencia(Empleado) :-
  trabajoEn(Empleado, X).

puedeAndar(ventas, Empleado) :-
  ambicioso(Empleado), tieneExperiencia(Empleado).

puedeAndar(ventas, lucia).
