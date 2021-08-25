%Hagamos unos pequeños cambios sobre la base de conocimientos que usamos antes; ahora nos servirá para saber:

%la cantidad de oro que tiene un lannister: lannister(Oro)
%edad y lobo de un stark: stark(edad,lobo(Nombre))
%Ejemplo:

personaje(joffrey,lannister(310)).
personaje(tommen,lannister(50)).
personaje(cersei,lannister(450)).
personaje(arya,stark(18,lobo(nymeria))).

%Escribir un predicado que nos dice si, dado un nombre de un personaje, es peligroso:

%? esPeligroso(joffrey).
%true

%Esto ocurre cuando es un Lannister con al menos 300 monedas de oro, o si es un Stark.

%Nota: Hacerlo delegando apropiadamente en un predicado esPersonajePeligroso/1, que trabaje directamente sobre el functor.

esPersonajePeligroso(lannister(Oro)) :-
  Oro >= 300.

esPersonajePeligroso(stark(_, _)).

esPeligroso(Nombre) :-
  personaje(Nombre, Atributos),
  esPersonajePeligroso(Atributos).
