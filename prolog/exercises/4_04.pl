%Tenemos una base de conocimiento construida sobre quien gusta de quien en un grupo de amigos, conformada por hechos y reglas de la forma gustaDe/2.

%Desarrolá el predicado compiten/2, que relaciona a dos personas cuando ambas tienen al menos un gusto en común.

%Asumí que gustaDe/2 ya se encuentra codificado y es completamente inversible.

compiten(Persona1, Persona2) :-
  gustaDe(Persona1, Target),
  gustaDe(Persona2, Target),
  Persona1 \= Persona2.
