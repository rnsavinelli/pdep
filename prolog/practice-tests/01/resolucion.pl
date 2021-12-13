:- encoding(utf8).

% 1 - Modelar con functores a cada uno de los carpinchos y definir un predicado para 
% indicar la existencia y poder usar de generador.

% De cada carpincho sabemos su nombre, una lista de habilidades (átomos) y sus
% atributos de fuerza, destreza y velocidad.

% carpincho(Nombre, Habilidades, Fuerza, Destreza, Velocidad).

carpincho(kike, [saltar, correr], atributos(100, 50, 40)).

carpincho(nacho, [olfatear, saltar], atributos(60, 80, 80)).

carpincho(alancito, [correr], atributos(80, 80, 70)).

carpincho(gastoncito, [olfatear], atributos(100, 30, 20)).

carpincho(sofy, [saltar, correr, olfatear], atributos(100, 90, 100)).

% esCarpincho(Nombre, carpincho(Nombre, Habilidades, Fuerza, Destreza, Velocidad)).

esCarpincho(Nombre, carpincho(Nombre, Habilidades, atributos(Fuerza, Destreza, Velocidad))) :-
    carpincho(Nombre, Habilidades, atributos(Fuerza, Destreza, Velocidad)).

% Uso: 
% ?- esCarpincho(juan, CarpinchoJuan).
% false.
%
% ?- esCarpincho(kike, CarpinchoKike).
% CarpinchoKike = carpincho(kike, [saltar, correr], 100, 50, 40).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Las disciplinas tienen distintos tipos de restricciones:

% De habilidades: Define una lista de habilidades que tiene que tener el 
% carpincho para poder participar.

% De atributos: Tiene valores de los atributos que tiene que cumplir el 
% carpincho (donde el valor puede ser 0 si el mismo no es necesario)

% Mixtas: Combinación de las dos anteriores. Además, todas tienen su nombre.
 
% Salto con Ramita: que tiene restricción de habilidades: correr y saltar

disciplina(armadoMadriguera, restriccionAtributos(0, 160, 0)).

disciplina(saltoConRamita, restriccionHabilidades([saltar, correr])).

disciplina(huidaDepredador, restriccionMixta(
    restriccionAtributos(0, 0, 80), restriccionHabilidades([olfatear, correr]))
).

% 2 - Saber si una disciplina, dado su nombre, es difícil: 

% Esto ocurre cuando se requieren más de 2 habilidades o bien,
% suma más de 300 puntos de atributos.

esDisciplinaDificil(NombreDeLaDisciplina) :-
    disciplina(NombreDeLaDisciplina, restriccionMixta(
        _, restriccionHabilidades(Habilidades)
    )),
    length(Habilidades, Cantidad),
    Cantidad > 2.

esDisciplinaDificil(NombreDeLaDisciplina) :-
    disciplina(NombreDeLaDisciplina, restriccionHabilidades(Habilidades)),
    length(Habilidades, Cantidad),
    Cantidad > 2.
    
esDisciplinaDificil(NombreDeLaDisciplina) :-
    disciplina(NombreDeLaDisciplina, restriccionAtributos(Fuerza, Destreza, Velocidad)),
    Fuerza + Destreza + Velocidad > 300.

esDisciplinaDificil(NombreDeLaDisciplina) :-
    disciplina(NombreDeLaDisciplina, restriccionMixta(
        restriccionAtributos(Fuerza, Destreza, Velocidad), _
    )),
    Fuerza + Destreza + Velocidad > 300.    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3 - Implementar un predicado que relacione a un carpincho y el nombre de una
% disciplina, si el primero puede realizarla.    

puedeRealizar(NombreCarpincho, NombreDeLaDisciplina) :-
    esCarpincho(NombreCarpincho, 
        carpincho(NombreCarpincho, _, atributos(Fuerza, Destreza, Velocidad))
    ),
    disciplina(NombreDeLaDisciplina, restriccionAtributos(RestriccionF, RestriccionD, RestriccionV)),
    Fuerza >= RestriccionF,
    Destreza >= RestriccionD,
    Velocidad >= RestriccionV.

puedeRealizar(NombreCarpincho, NombreDeLaDisciplina) :-
    esCarpincho(NombreCarpincho, 
        carpincho(NombreCarpincho, _, atributos(Fuerza, Destreza, Velocidad))
    ),
    disciplina(NombreDeLaDisciplina, restriccionMixta( 
        restriccionAtributos(RestriccionF, RestriccionD, RestriccionV), _
    )),
    Fuerza >= RestriccionF,
    Destreza >= RestriccionD,
    Velocidad >= RestriccionV.

puedeRealizar(NombreCarpincho, NombreDeLaDisciplina) :-
    esCarpincho(NombreCarpincho, 
        carpincho(NombreCarpincho, Habilidades, _)
    ),
    disciplina(NombreDeLaDisciplina, restriccionHabilidades(RestriccionH)),
    forall(member(H, RestriccionH), member(H, Habilidades)).

puedeRealizar(NombreCarpincho, NombreDeLaDisciplina) :-
    esCarpincho(NombreCarpincho, 
        carpincho(NombreCarpincho, Habilidades, _)
    ),
    disciplina(NombreDeLaDisciplina, restriccionMixta( 
        _ , restriccionHabilidades(RestriccionH)
    )),
    forall(member(H, RestriccionH), member(H, Habilidades)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4 - Saber si un carpincho es extraño, esto pasa cuando todas las disciplinas 
% que puede realizar son difíciles.

esExtranio(NombreCarpincho) :-
    esCarpincho(NombreCarpincho, _),
    puedeRealizar(NombreCarpincho, _),
    forall(
        puedeRealizar(NombreCarpincho, NombreDeLaDisciplina),
        esDisciplinaDificil(NombreDeLaDisciplina)
    ).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5 - Saber, dados dos carpinchos y el nombre de una disciplina, cuál es el
% ganador, sabiendo que:

% Si uno solo puede participar, es el ganador.

ganador(NombreCarpincho1, NombreCarpincho2, NombreDeLaDisciplina, NombreCarpincho2) :-
    esCarpincho(NombreCarpincho1, _),
    esCarpincho(NombreCarpincho2, _),
    disciplina(NombreDeLaDisciplina, _),
    not(puedeRealizar(NombreCarpincho1, NombreDeLaDisciplina)),
    puedeRealizar(NombreCarpincho2, NombreDeLaDisciplina).

ganador(NombreCarpincho1, NombreCarpincho2, NombreDeLaDisciplina, NombreCarpincho1) :-
    esCarpincho(NombreCarpincho1, _),
    esCarpincho(NombreCarpincho2, _),
    disciplina(NombreDeLaDisciplina, _),
    puedeRealizar(NombreCarpincho1, NombreDeLaDisciplina),
    not(puedeRealizar(NombreCarpincho2, NombreDeLaDisciplina)).

% Si los dos pueden participar en la disciplina, gana el que tenga más 
% sumatoria de atributos.

ganador(NombreCarpincho1, NombreCarpincho2, NombreDeLaDisciplina, NombreCarpincho1) :-
    esCarpincho(NombreCarpincho1, carpincho(NombreCarpincho1, _, atributos(Fuerza1, Destreza1, Velocidad1))),
    esCarpincho(NombreCarpincho2, carpincho(NombreCarpincho2, _, atributos(Fuerza2, Destreza2, Velocidad2))),
    disciplina(NombreDeLaDisciplina, _),
    puedeRealizar(NombreCarpincho1, NombreDeLaDisciplina),
    puedeRealizar(NombreCarpincho2, NombreDeLaDisciplina),
    Fuerza1 + Destreza1 + Velocidad1 > Fuerza2 + Destreza2 + Velocidad2.

ganador(NombreCarpincho1, NombreCarpincho2, NombreDeLaDisciplina, NombreCarpincho1) :-
    esCarpincho(NombreCarpincho1, carpincho(NombreCarpincho1, _, atributos(Fuerza1, Destreza1, Velocidad1))),
    esCarpincho(NombreCarpincho2, carpincho(NombreCarpincho2, _, atributos(Fuerza2, Destreza2, Velocidad2))),
    disciplina(NombreDeLaDisciplina, _),
    puedeRealizar(NombreCarpincho1, NombreDeLaDisciplina),
    puedeRealizar(NombreCarpincho2, NombreDeLaDisciplina),
    Fuerza2 + Destreza2 + Velocidad2 > Fuerza1 + Destreza1 + Velocidad1.

% Si ninguno participa, ninguno gana.
% Nota: Pensar... ¿Cuántas cosas se deben relacionar?

ganador(NombreCarpincho1, NombreCarpincho2, NombreDeLaDisciplina, _) :-
    esCarpincho(NombreCarpincho1, _),
    esCarpincho(NombreCarpincho2, _),
    disciplina(NombreDeLaDisciplina, _),
    not(puedeRealizar(NombreCarpincho1, NombreDeLaDisciplina)),
    not(puedeRealizar(NombreCarpincho2, NombreDeLaDisciplina)),
    false.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 6 - Durante la cuarentena, nuestros amiguitos estuvieron preparándose para 
% este gran evento deportivo con distintos entrenamientos. 

% Implementar los siguientes entrenamientos, que relacionan una cantidad, 
% un carpincho y el mismo carpincho después de entrenar:

% pesasCarpinchas/3: aumenta la fuerza de un carpincho un cuarto de la 
% cantidad de peso que levantaron

pesasCarpinchas(Cantidad, carpincho(N, H, atributos(F1, D, V)), carpincho(N, H, atributos(F2, D, V))) :-
    F2 is F1 + Cantidad / 4.

% atrapaLaRana/3: aumenta la destreza en igual cantidad que las ranas atrapadas

atrapaLaRana(Cantidad, carpincho(N, H, atributos(F, D1, V)), carpincho(N, H, atributos(F, D2, V))) :-
    D2 is D1 + Cantidad.

% cardiopincho/3: aumenta la velocidad el doble de los kilómetros recorridos 
% (claramente en cinta, porque no podían salir)

cardiopincho(Cantidad, carpincho(N, H, atributos(F, D, V1)), carpincho(N, H, atributos(F, D, V2))) :-
    V2 is V1 + Cantidad * 2.

% Nota: No hace falta que este predicado sea inversible para ninguno de los 
% argumentos

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 7 - Hacer aCuantosLesGana/3. Que relaciona un carpincho, nombre de disciplina
% y la cantidad de carpinchos a los que les gana en esa disciplina.

aCuantosLesGana(NombreCarpincho, Disciplina, Cantidad) :-
    esCarpincho(NombreCarpincho, _),
    findall(
        NombreEnemigo,
        ganador(NombreCarpincho, NombreEnemigo, Disciplina, NombreCarpincho),
        CarpinchosVencidos
    ),
    length(CarpinchosVencidos, Cantidad).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 8 - Queremos saber si entre nuestros atletas se encuentra el mítico 
% "carpincho de oro”, que aparece una vez cada milenio y es aquel que les gana 
% a todos los demás en todas las disciplinas.

esCarpinchoDeOro(NombreCarpincho) :-
    esCarpincho(NombreCarpincho, _),
    findall(
        NombreEnemigo,
        ganador(NombreCarpincho, NombreEnemigo, _, NombreEnemigo),
        CarpinchosVencedores
    ),
    length(CarpinchosVencedores, 0).
