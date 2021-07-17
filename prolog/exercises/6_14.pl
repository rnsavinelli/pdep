%Ahora te toca a vos: escribi el predicado buenaNota/1, que diga si una nota es mayor o igual a 4.

%Este predicado tiene que ser (totalmente) inversible.

%? buenaNota(5). yes.

%? buenaNota(Nota). Nota = 4; Nota = 5; Nota = 6; ... Nota = 7.

buenaNota(Nota) :-
  between(4, 10, Nota).
