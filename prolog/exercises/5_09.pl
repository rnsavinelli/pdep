%Escribí un predicado maximo/3, que relacione dos números con su máximo:

%? maximo(3, 4, 4).
%yes
%? maximo(30, 4, 30).
%yes

maximo(NumeroA, NumeroB, NumeroA) :-
  NumeroA >= NumeroB.

maximo(NumeroA, NumeroB, NumeroB) :-
  NumeroB >= NumeroA.
