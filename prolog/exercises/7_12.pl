%En un juego online, queremos saber si un equipo está al horno: esto ocurre cuando todos sus miembros

%o bien estan débiles (menos de 10 de energía)
%o bien estan fuera del juego
%Considerar que un equipo debe tener al menos un miembro para considerarse al horno.

%Escribir el predicado inversible alHorno/1, que responda si un equipo está al horno. Asumir que se cuenta con los siguiente predicados:

%fueraDeJuego/1, que toma un participante
%nivelDeEnergia/2, que relaciona a un participante con su nivel de energía
%perteneceA/2, que relaciona a un participante con el equipo al que pertence

alHorno(Equipo) :-
  perteneceA(_, Equipo),
  forall(
    perteneceA(Participante, Equipo),
    (fueraDeJuego(Participante) ; energiaBaja(Participante))
  ).

energiaBaja(Participante) :-
  nivelDeEnergia(Participante, Energia),
  Energia < 10.
