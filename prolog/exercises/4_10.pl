%Para cerrar, queremos saber en qué país hay más ejércitos.

%Usando el predicado ocupa/3 que relaciona al país, al jugador que lo ocupa y la cantidad de ejércitos, desarrollá el predicado elPaisMasFuerte/1 que se cumpla para el país que maximice la cantidad de ejércitos que tiene.

maximizaEjercito(EjercitoMaximo) :-
  forall(
    ocupa(Pais, _, Ejercito),
    EjercitoMaximo >= Ejercito
  ).

elPaisMasFuerte(Pais) :-
  ocupa(Pais, _, Ejercitos),
  maximizaEjercito(Ejercitos).
