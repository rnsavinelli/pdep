%Siguiendo en nuestra competencia de habilidades, queremos saber el puntaje total que obtuvo un competidor. Éste se calcula así:

%Si alguno de los tres puntajes (lanzamiento, martillo, escoba) no llega a 5, entonces es 0
%En caso contrario, es la suma de los 3 puntajes.
%Codificar el predicado puntajeTotal/2 que relaciona a un competidor con su puntaje total.

%Nota: asumir que ya existen predicados puntajeLanzamientoPrecision/2, puntajeFuerzaMartillo/2 y puntajeEquilibrioEscoba/2 que relacionan a un competidor con su puntaje en cada prueba.

puntajeTotal(Competidor, 0) :-
  puntajeLanzamientoPrecision(Competidor, PuntajePrecision),
  puntajeFuerzaMartillo(Competidor, PuntajeMartillo),
  puntajeEquilibrioEscoba(Competidor, PuntajeEquilibrio),
  (PuntajePrecision < 5 ; PuntajeMartillo < 5 ; PuntajeEquilibrio < 5).

puntajeTotal(Competidor, Puntaje) :-
  puntajeLanzamientoPrecision(Competidor, PuntajePrecision),
  puntajeFuerzaMartillo(Competidor, PuntajeMartillo),
  puntajeEquilibrioEscoba(Competidor, PuntajeEquilibrio),
  Puntaje is PuntajePrecision + PuntajeMartillo + PuntajeEquilibrio.
