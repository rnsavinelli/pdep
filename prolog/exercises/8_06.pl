%Cuando escribimos

%personajeMujer(Nombre) :-
%  personaje(Nombre, stark(_, mujer)).
%personajeMujer(Nombre) :-
%  personaje(Nombre, lannister(_, mujer)).

%Repetimos dos veces el generador personaje. Te proponemos esta forma de mejorar la solución:

personajeMujer(Nombre) :-
  personaje(Nombre, Personaje),
  esMujer(Personaje).

esMujer(stark(_, mujer)).
esMujer(lannister(_, mujer)).

%De esta forma estamos tratando de forma indistinta a los functores stark/2 y lannister/2. Y eso lo podemos hacer gracias a que, son diferentes, pero no tanto: de ambos podemos conocer sexo y edad.

%Volvé a definir el predicado personajeAdulto/1 pero esta vez definiendo y usando un predicado auxiliar esAdulto/1

esAdulto(stark(Edad, _)) :-
  Edad >= 16.

esAdulto(lannister(Edad, _)) :-
  Edad >= 16.

personajeAdulto(Nombre) :-
  personaje(Nombre, Atributos),
  esAdulto(Atributos).
