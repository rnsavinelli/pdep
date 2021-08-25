%A nuestra base de conocimientos de casas agregamos a la Guardia de la Noche:

personaje(jon,nightwatch(23,lobo(ghost))).
personaje(sam,nightwatch(23)).
% etc

%Agregar una cláusula a esPersonajePeligroso/1 de forma que un Guardia de la Noche sea peligroso sólo si tiene un lobo. No se debe utilizar el predicado personaje para esto.

esPersonajePeligroso(nightwatch(_,lobo(_))).
