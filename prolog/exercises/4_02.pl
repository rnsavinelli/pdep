%Y seguimos queriendo saber cosas de la empresa. Ahora toca saber quién le puede dar órdenes a quién.

%Se dice que A puede darle órdenes a B si y sólo si trabajan en el mismo departamento y A tiene un cargo superior a B. Se considera que gerente es un cargo superior a cadete.

%Desarrollá un predicado daOrdenes/2: que relaciona a dos personas tales que la primera puede darle órdenes a la segunda.

%Asumí que ya existen en la base de conocimiento predicados de la forma empleado/3, que relacionan a un departamento con un empleado y su cargo.

%daOrdenes(Persona1, Persona2) :-
daOrdenes(Persona1, Persona2) :-
  Persona1 \= Persona2,
  empleado(Departamento, Persona1, gerente),
  empleado(Departamento, Persona2, cadete).
