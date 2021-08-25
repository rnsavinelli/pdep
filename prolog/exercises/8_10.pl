%Pero capaz te estás preguntando: ¿por qué definir varias clausulas de un mismo predicado, en lugar de definir varios predicados diferentes? La ventaja la vemos cuando hay otro predicado que lo usa. Ejemplo:

%esPeligroso(Nombre, Personaje) :-
%  personaje(Nombre, Personaje),
%  esPersonajePeligroso(Personaje).

%Como vemos, al haber resuelto el problema con múltiples cláusulas en lugar de múltiples predicados, pudimos definir un sólo predicado esPeligroso/2, que delega apropiadamente, evitando así repetir lógica. ¡Yeahhh !

%Y lo interesante es que esPeligroso puede tratar con múltiples tipos de functores, pero no lo sabe: los trata de forma indiferenciada.

%¿Saben algo? Esto tiene un nombre: se llama polimorfismo.

%Veamos si se entiende: definir un predicado cuantoSabe/2 que, utilizando el predicado definido en el ejercicio anterior, cuantoSabePersonaje/2, trate polimórficamente a los functores. Ejemplo:

%? cuantoSabe(jon, Cuanto).
%Cuanto = nada.

cuantoSabe(Nombre, Conocimiento) :-
  personaje(Nombre, Personaje),
  cuantoSabePersonaje(Personaje, Conocimiento).
