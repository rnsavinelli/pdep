%Teniendo la base de conocimiento anterior, podemos averiguar algunas cosas más, como por ejemplo, si un individuo el tío de otro, o si es su hermano.

%Asumiendo que ya contamos con una base de conocimiento con predicados padre/2, agregar los predicados tio/2 y hermano/2. Ejemplo:

%? tio(herbert, lisa).
%yes. % porque herbert es el hermano del padre de lisa

%? hermano(bart, lisa).
%yes. % porque bart y lisa comparten un padre

%? hermano(bart, bart).
%no. % ¡porque bart y bart son la misma persona! Y vos no sos tu propio hermano

hermano(Hermano1, Hermano2) :-
  Hermano1 \= Hermano2,
  padre(Padre, Hermano1),
  padre(Padre, Hermano2).

tio(Tio, Sobrino) :-
  Tio \= Sobrino,
  padre(Hermano, Sobrino),
  hermano(Hermano, Tio).
