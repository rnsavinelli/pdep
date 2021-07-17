%Escribí un predicado maximo/3, que relacione dos números con su máximo:

%? maximo(3, 4, 4).
%yes
%? maximo(30, 4, 30).
%yes

maximo(NumeroA, NumeroB, MaximoEntreAyB) :-
  (MaximoEntreAyB == NumeroA ; MaximoEntreAyB == NumeroB),
  (
    ((NumeroA > NumeroB), MaximoEntreAyB is NumeroA);
    ((NumeroA < NumeroB), MaximoEntreAyB is NumeroB);
    (MaximoEntreAyB is NumeroB; MaximoEntreAyB is NumeroA)
  ).
