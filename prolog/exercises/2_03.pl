%¡Tenemos nuevos sectores!: proyectos y logística. Y queremos saber qué empleados pueden servir para cada uno de ellos. Se sabe que:

%proyectos: pueden andar ingenieros con experiencia y también abogados jóvenes.
%logística: pueden andar profesionales (ingenieros o abogados) que sean jóvenes o tengan experiencia.
%Además se sabe que:

%Fulgencio pueda andar para proyectos pero no para logística
%Clotilde pueda andar para ventas pero no para contaduría.
%Asumir que la base de conocimiento ya contiene algunos otros empleados, con hechos de la forma: conExperiencia/1, joven/1, ingeniero/1, abogado/1

%Codificar las nuevas clausulas del predicado puedeAndar/2, que relaciona a un sector con un empleado.

profesional(Persona) :-
  ingeniero(Persona).

profesional(Persona) :-
  abogado(Persona).

puedeAndar(proyectos, Persona) :-
  ingeniero(Persona), conExperiencia(Persona).

puedeAndar(proyectos, Persona) :-
  abogado(Persona), joven(Persona).

puedeAndar(logistica, Persona) :-
  profesional(Persona), joven(Persona).

puedeAndar(logistica, Persona) :-
  profesional(Persona), conExperiencia(Persona).

puedeAndar(proyectos, fulgencio).

puedeAndar(ventas, clotilde).
