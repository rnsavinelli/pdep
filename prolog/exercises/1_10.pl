%Escribí un predicado personajeSurrealista/1, que dice si un personaje es surrealista. Esto ocurre cuando aparece en una pintura surrealista, o en cuento surrealista.

%Además dali es un personaje surrealista por definición.

%Asumí que ya existen los predicados apareceEnPinturaSurrealista/1 y personajeDeCuentoSurrealista/1

personajeSurrealista(Personaje) :-
    apareceEnPinturaSurrealista(Personaje).

personajeSurrealista(Personaje) :-
    personajeDeCuentoSurrealista(Personaje).

personajeSurrealista(dali).
