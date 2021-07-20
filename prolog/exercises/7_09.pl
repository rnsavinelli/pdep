%Finalmente, la última competencia consiste caminar con una escoba en la nariz sin que se caiga.

%Los resultados de esta prueba se expresan en la base de conocimiento así:

%metrosEscoba(ricky,13).
% etc...
%Queremos conocer el puntaje de un competidor en esta prueba, sabiendo que Y el puntaje de la prueba es 1 punto cada 3 metros recorridos.

%Desarrollar los predicado puntajeEquilibrioEscoba/2 que relaciona a un competidor con su puntaje obtenido en esta prueba. Ejemplo:

%? puntajeEquilibrioEscoba(ricky, Puntaje).
%Puntaje = 4. %%Se redondea al entero más cercano.

puntajeEquilibrioEscoba(Competidor, Puntaje) :-
  metrosEscoba(Competidor, Metros),
  Puntaje is round(Metros / 3).
