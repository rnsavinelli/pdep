%Escribí un predicado abandono/1 que diga si un equipo abandonó el juego. Esto es verdadero cuando no tiene ningún integrante.

%Asumir que se cuenta con un predicado equipo/1, que dice si un individuo es un equipo, y el predicado perteneceA/2, que relaciona a un integrante con su equipo.

abandono(Equipo) :-
  equipo(Equipo),
  not(perteneceA(_, Equipo)).
