:- encoding(utf8).

sinRepetidos([], []).

sinRepetidos([Head | Tail], ListaSinRepetidos) :-
    member(Head, Tail), !,
    sinRepetidos(Tail, ListaSinRepetidos).

sinRepetidos([Head | Tail], [Head | ListaSinRepetidos]) :-
    sinRepetidos(Tail, ListaSinRepetidos).
