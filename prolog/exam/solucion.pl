% Metaparcial

:- encoding(utf8).

% Imports
:- consult(lib).

% parcial(Tema, [Puntos]).
temaCopado(chocobos).
temaCopado(inversiones).
temaCopado(harryPotter).
temaCopado(carpinchos).
temaCopado(bidones).
temaCopado(piratas).
temaCopado(tierraMedia).
temaCopado(kraken).

punto(primerOrden).
punto(ordenSuperior).
punto(polimorfismo).
punto(listas).
punto(relleno).
punto(modelado).
punto(diagramado).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1 - Hacer parcialEvalua/2 que relaciona un parcial con un punto que evalúa. 
% No requiere ser inversible para el parcial.

parcialEvalua(parcial(_, Puntos), Punto) :-
    punto(Punto),
    member(Punto, Puntos).

% Ejemplo de uso:

% ?- parcialEvalua(parcial(chocobos, [modelado, relleno]), X).
% X = relleno ;
% X = modelado ;
% false.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2 - Hacer esParcialListo/1 que resulta verdadero para un parcial que cumple todas
% las reglas de los parciales (tiene entre 7 y 10 puntos, tiene un tema copado 
% y evalúa todos los puntos al menos una vez). No requiere ser inversible para 
% el parcial.

esParcialListo(parcial(Tema, Puntos)) :-
    temaCopado(Tema),
    length(Puntos, Cantidad),
    between(7, 10, Cantidad),
    findall(PuntoAEvaluar, punto(PuntoAEvaluar), PuntosAEvaluar),
    forall(
        member(PuntoAEvaluar, PuntosAEvaluar),
        member(PuntoAEvaluar, Puntos)
    ).

% Ejemplo de uso:

% ? - esParcialListo(parcial(kraken, [primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado])).
% true.

% esParcialListo(parcial(kraken, [primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, modelado])).
% false.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3 - Hacer puntosInventados/1, que genera una lista de puntos de cantidad válida.

% 7 Puntos
puntosInventados(Puntos) :-
    findall(PuntoAEvaluar, punto(PuntoAEvaluar), Puntos).

% 8 Puntos
puntosInventados(Puntos) :-
    findall(PuntoAEvaluar, punto(PuntoAEvaluar), PuntosAEvaluar),
    member(Punto8, PuntosAEvaluar),
    flatten([Punto8, PuntosAEvaluar], Puntos).

% 9 Puntos
puntosInventados(Puntos) :-
    findall(PuntoAEvaluar, punto(PuntoAEvaluar), PuntosAEvaluar),
    member(Punto8, PuntosAEvaluar),
    member(Punto9, PuntosAEvaluar),
    flatten([Punto8, Punto9, PuntosAEvaluar], Puntos).

% 10 Puntos
puntosInventados(Puntos) :-
    findall(PuntoAEvaluar, punto(PuntoAEvaluar), PuntosAEvaluar),
    member(Punto8, PuntosAEvaluar),
    member(Punto9, PuntosAEvaluar),
    member(Punto10, PuntosAEvaluar),
    flatten([Punto8, Punto9, Punto10, PuntosAEvaluar], Puntos).

% Ejemplo de uso:

% ?- puntosInventados(X).
% X = [primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado] ;
% X = [primerOrden, primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado] ;
% X = [ordenSuperior, primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado] ;
% ...

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4 - Hacer nuevoParcial/1, que debe generar un parcial nuevo que esté listo

nuevoParcial(parcial(Tema, Puntos)) :- 
    temaCopado(Tema),
    puntosInventados(Puntos),
    esParcialListo(parcial(Tema, Puntos)).
 
 % Ejemplo de uso:

% ? - nuevoParcial(X).
% X = parcial(chocobos, [primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado]) ;
% X = parcial(chocobos, [primerOrden, primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado]) ;
% X = parcial(chocobos, [ordenSuperior, primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado]) ;
% ...

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5- Ya que nos están haciendo los parciales, vamos a tratar de predecir quienes van a
% aprobar. Agregar a la base de conocimiento un predicado que relacione el nombre de
% un estudiante y un punto que sabe, con ejemplos.

estudiante(tomas, primerOrden). 
estudiante(tomas, ordenSuperior). 
estudiante(tomas, polimorfismo). 
estudiante(tomas, listas). 
estudiante(tomas, relleno). 
estudiante(tomas, modelado). 
estudiante(tomas, diagramado).

estudiante(agus, primerOrden). 
estudiante(agus, ordenSuperior). 
estudiante(agus, polimorfismo). 
estudiante(agus, listas). 
estudiante(agus, relleno). 
estudiante(agus, diagramado).

estudiante(lucas, listas). 
estudiante(lucas, relleno). 
estudiante(lucas, modelado). 
estudiante(lucas, diagramado).

estudiante(marta, primerOrden). 
estudiante(marta, ordenSuperior). 
estudiante(marta, polimorfismo). 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 6 - Hacer aprueba/2, que relaciona a un estudiante con un parcial, siempre y 
% cuando sepa todos los temas que este último abarca. No requiere ser 
% inversible para el parcial.

aprueba(NombreEstudiante, parcial(_, Puntos)) :-
    estudiante(NombreEstudiante, _),
    forall(
        member(Punto, Puntos),
        estudiante(NombreEstudiante, Punto)
    ).

 % Ejemplo de uso:

% ? - aprueba(tomas, parcial(chocobos, [primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado])).
% true.

% ? - aprueba(marta, parcial(chocobos, [primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado])).
% false.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 7 - Hacer una consulta que unifique la variable Aprobados con una lista de 
% todos los estudiantes que aprueban este parcial:

% parcial(chocobos, [primerOrden, primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado]). 

% Nota: No definir un nuevo predicado.

% Consulta:
% ? - aprueba(Alumno, parcial(chocobos, [primerOrden, primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado])).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 8 - Saber si un parcial es sólo para elegidos, que es cuando sólo un alumno 
% puede aprobarlo. No requiere ser inversible para el parcial.

parcialParaElegidos(Parcial) :-
    findall(Alumno, aprueba(Alumno, Parcial), Alumnos),
    sinRepetidos(Alumnos, AlumnosSinRepetidos),
    length(AlumnosSinRepetidos, Cantidad),
    Cantidad =:= 1.

 % Ejemplo de uso:
    
% ?- parcialParaElegidos(parcial(chocobos, [primerOrden, primerOrden, ordenSuperior, polimorfismo, listas, relleno, modelado, diagramado])).
% true.



  