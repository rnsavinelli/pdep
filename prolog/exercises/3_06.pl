%En Prolog, todas las cosas que preguntamos están implícitamente cuantificadas mediante un operador de existencia. Eso significa que da lo mismo si hay una sola o múltiples formas de probar algo: a Prolog sólo le importa que exista al menos una prueba para responder yes.

%Veamos si queda claro: escribí un predicado sonVecinos/2 que nos dice si dos personas distintas son vecinas; esto ocurre cuando viven en la misma zona

sonVecinos(PersonaA, PersonaB) :-
  viveEn(PersonaA, Zona), viveEn(PersonaB, Zona), PersonaA \== PersonaB.
