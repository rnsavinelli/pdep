%Queremos conocer los rivales de una determinada selección en un campeonato mundial. Se sabe que:

%El grupo A está formado por Colombia, Camerún, Jamaica e Italia.
%El grupo B está formado por Argentina, Nigeria, Japón y Escocia.
%Y que una selección tiene como rivales todos los otros equipos de su mismo grupo (¡nunca contra sí misma!).

%Con todo esto, codificar el predicado rival/2, que relaciona dos selecciones que son rivales.

%?- rival(argentina, nigeria).
%yes
%?- rival(argentina, argentina).
%no

grupoA(colombia).
grupoA(camerun).
grupoA(jamaica).
grupoA(italia).

grupoB(argentina).
grupoB(nigeria).
grupoB(japon).
grupoB(escocia).

rival(Equipo1, Equipo2) :-
  (grupoA(Equipo1), grupoA(Equipo2));
  (grupoB(Equipo1), grupoB(Equipo2)),
  Equipo1 \= Equipo2.
