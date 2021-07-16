%Agregamos más información a nuestra base de conocimientos que nos dice en qué continente se encuentra cada país mediante el predicado estaEn/2 que relaciona un continente y un país.

%Con esta nueva información definí los siguientes predicados:

%ocupaContinente/2 que relaciona un jugador y un continente si el jugador ocupa todos los países del mismo.
%estaPeleado/1 que se cumple para los continentes en los cuales todos los jugadores ocupan algún país.
%seAtrinchero/1 que se cumple para los jugadores que ocupan países en un único continente.
%Asumí que ocupa/3 que relaciona un país con un jugador ya se encuentra definido también.

ocupaContinente(Jugador, Continente) :-
  forall(
    estaEn(Continente, Pais),
    ocupa(Pais, Jugador, _)
  ).

estaPeleado(Continente) :-
  forall(
    ocupa(_, Jugador, _),
    (estaEn(Continente, Pais), ocupa(Pais, Jugador, _))
  ).

estaEnUnSoloContinente(Jugador, Continente) :-
  forall(
    ocupa(Pais, Jugador, _),
    estaEn(Continente, Pais)
  ).

seAtrinchero(Jugador) :-
  % Me quedo con el primer continente que encuentro:
  ocupa(Pais, Jugador, _),
  estaEn(Continente, Pais),
  % Me fijo si todos los paises estan en ese continente:
  estaEnUnSoloContinente(Jugador, Continente).
