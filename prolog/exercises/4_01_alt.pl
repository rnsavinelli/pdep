%Tenemos el conocimiento de quiénes trabajan en una empresa, y queremos saber quién trabaja con quién.

%Desarrollá un predicado trabajaCon/2: que relaciona a dos personas distintas cuando ambas trabajan en el mismo sector.

%Asumí que existe un predicado trabajaEn/2, que relacionan a un departamento con un empleado que trabaja allí.

% trabajaCon(Persona1, Persona2)
trabajaCon(P1, P2) :-
  trabajaEn(Departamento, P1),
  trabajaEn(Departamento, P2),
  P1 \= P2.
