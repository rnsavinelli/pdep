mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).

parent(jane, bill).
parent(john, bill).

female(jane).
male(john).
