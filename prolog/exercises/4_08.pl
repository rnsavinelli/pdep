%Disponemos de una base de conocimientos que contiene la información de un juego de TEG.

%En principio tenemos los siguientes predicados:

%ocupa/3: que relaciona un país con un jugador y la cantidad de ejércitos que tiene en ese país
%sonLimitrofes/2: es una relación simétrica entre países limítrofes
%aliados/2: es una relación simétrica entre jugadores que son aliados
%A partir de esta información, desarrollá los siguientes predicados:

%puedenAtacarse/2 que relaciona dos jugadores distintos si ocupan algún país limítrofe del otro y no son aliados.
%loLiquidaron/1 que se cumple para un jugador si no ocupa ningún país.

puedenAtacarse(Jugador1, Jugador2) :-
  Jugador1 \= Jugador2,
  ocupa(Pais1, Jugador1, _),
  ocupa(Pais2, Jugador2, _),
  Pais1 \= Pais2,
  sonLimitrofes(Pais1, Pais2),
  not(aliados(Jugador1, Jugador2)).

loLiquidaron(Jugador) :-
  not(ocupa(_, Jugador, _)).
