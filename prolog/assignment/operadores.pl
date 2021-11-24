% xor, pero como operador.
% ref: https://www.swi-prolog.org/pldoc/man?predicate=op/3
:- op(500, xfy, #).

X # not(_Y) :- X.
not(_X) # Y :- Y.