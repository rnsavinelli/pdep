% Socrates is a man.
% If Socrates is a man, then Socrates is mortal.
% Therefore, Socrates is mortal.

man(socrates).
mortal(X) :- man(X).
