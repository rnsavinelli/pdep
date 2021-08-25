%Cuando escribamos patrones de functores, los nombres de los functores no pueden ser variables.

%Por ejemplo, si quiero obtener los nombres de todas las mujeres (sean stark o lannister), lo siguiente NO funciona:

%personajesMujeres(Nombre) :-
%  personaje(Nombre, _(_, mujer)).

%La forma correcta de hacerlo es la siguiente, asumiendo que solamente hay lannisters y starks en nuestra base de conocimientos:

personajeMujer(Nombre) :-
  personaje(Nombre, stark(_, mujer)).
personajeMujer(Nombre) :-
  personaje(Nombre, lannister(_, mujer)).

%Veamos si queda claro: escribí un predicado personajeAdulto/1, que genera los nombres de personajes mayores a 15, sin importar casa ni sexo.

personajeAdulto(Nombre) :-
  personaje(Nombre, lannister(Edad, _)),
  Edad >= 16.

personajeAdulto(Nombre) :-
  personaje(Nombre, stark(Edad, _)),
  Edad >= 16.
