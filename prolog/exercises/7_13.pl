%Al juego anterior queremos agregarle un nuevo requerimiento: saber si un equipo es cipayo, esto ocurre cuando existen al menos dos miembros del equipo que también juegan para otro equipo.

%Escribí el predicado equipoCipayo/1. Asumí que contás con el predicado perteneceA/2, que relaciona a un participante con el equipo al que pertenece.

equipoCipayo(Equipo) :-
  perteneceA(Miembro1, Equipo),
  perteneceA(Miembro2, Equipo),
  Miembro1 \= Miembro2,
  perteneceA(Miembro1, EquipoAlt1),
  perteneceA(Miembro2, EquipoAlt2),
  Equipo \= EquipoAlt1,
  Equipo \= EquipoAlt2.
