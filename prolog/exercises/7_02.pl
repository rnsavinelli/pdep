%  Definir un predicado mitad/2, que relaciona un número con su mitad.

mitad(Number, HalfThatNumber) :-
  Number is (2 * HalfThatNumber).

%mitad(Number, HalfThatNumber) :-
%  HalfThatNumber is (Number / 2).
