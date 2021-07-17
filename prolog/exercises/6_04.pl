%Un problema más: queremos saber ahora sobre los abuelos y los abuelos babosos en la familia.

%Vamos a decir que un individuo es baboso con otro cuando es su abuelo y ademas el nieto tiene menos de dos años . Ejemplo:

%? abuelo(abraham, bart).
%yes.

%? baboso(abraham, maggie).
%yes. % porque maggie es nieta de Abraham y tiene menos de dos años

%Completá la base de conocimiento, de forma que podamos consultarla mediante abuelo/2 y baboso/2

%Asumí que ya contás con el predicado padre/2 en tu base de conocimiento, y con el predicado edad/2, que relaciona a un personaje con su edad

abuelo(Abuelo, Nieto) :-
  padre(Abuelo, Padre),
  padre(Padre, Nieto).

baboso(Abuelo, Nieto) :-
  abuelo(Abuelo, Nieto),
  edad(Nieto, Edad),
  Edad < 2.
