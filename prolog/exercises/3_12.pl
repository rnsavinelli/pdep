%Escribí un predicado dificilDeEstacionar/1, que es verdadero para una zona habitada si todos sus habitantes tienen auto.

%Decimos que una zona está habitada cuando vive al menos una persona en ella.

dificilDeEstacionar(Zona) :-
  zonaHabitada(Zona),
  forall(viveEn(Persona, Zona), tieneAuto(Persona)).

zonaHabitada(Zona) :-
  viveEn(_, Zona).
