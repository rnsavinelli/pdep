%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Imports
:- consult(materias).
:- consult(correlatividades).
:- consult(operadores).

% Ignore Warnings
:- discontiguous([
  cursada/3, recurso/2
]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Las Materias

% Queremos saber si una materia es pesada.
% Las materias pesadas son:
% - todas las integradoras de 6 o más horas por semana.
% - también son las que poseen una cursada larga, de al menos 4 horas por semana, pero que no son integradoras.

esMateriaPesada(Materia) :-
    materia(Materia, CantidadDeHoras),
    esMateriaIntegradora(Materia),
    CantidadDeHoras >= 6.

esMateriaPesada(Materia) :-
    materia(Materia, CantidadDeHoras),
    not(esMateriaIntegradora(Materia)),
    CantidadDeHoras >= 4.

% Tests

:- begin_tests(materias_pesadas).

 test(proyecto_final_es_materia_pesada, nondet):-
   esMateriaPesada(proyecto_Final).

 test(sistemas_y_organizaciones_no_es_materia_pesada, nondet):-
   not(esMateriaPesada(sistemas_y_Organizaciones)).

 test(sistemas_operativos_es_materia_pesada, nondet):-
   esMateriaPesada(sistemas_Operativos).

 test(ingles_i_no_es_materia_pesada, nondet):-
   not(esMateriaPesada(ingles_I)).

:- end_tests(materias_pesadas).

% Sin embargo, las materias no se pueden cursar en cualquier orden.
% Tienen una secuencia determinada por las correlativas.
% Esto significa que para cursar ciertas materias, es necesario haber cursado otras antes.
% Se pide conocer:

% Las materias iniciales: son aquellas que no piden ninguna materia para cursarlas.

esMateriaInicial(Materia) :-
    materia(Materia, _),
    not(esMateriaCorrelativa(Materia, _)).

% Tests

:- begin_tests(materias_iniciales).

 test(analisis_matematico_i_es_materia_inicial):-
   esMateriaInicial(analisis_Matematico_I).

 test(algebra_y_geometria_analitica_es_materia_inicial):-
   esMateriaInicial(algebra_y_Geometria_Analitica).

 test(matematica_discreta_es_materia_inicial):-
   esMateriaInicial(matematica_Discreta).

 test(sistemas_y_organizaciones_es_materia_inicial):-
   esMateriaInicial(sistemas_y_Organizaciones).

 test(algoritmos_y_estructuras_de_datos_es_materia_inicial):-
   esMateriaInicial(algoritmos_y_Estructuras_de_Datos).

 test(arquitectura_de_computadoras_es_materia_inicial):-
   esMateriaInicial(arquitectura_de_Computadoras).

 test(ingenieria_y_sociedad_es_materia_inicial):-
   esMateriaInicial(ingenieria_y_Sociedad).

 test(quimica_es_materia_inicial):-
   esMateriaInicial(quimica).

 test(fisica_i_es_materia_inicial):-
   esMateriaInicial(fisica_I).

 test(ingles_i_es_materia_inicial):-
   esMateriaInicial(ingles_I).

 test(sistemas_de_representacion_es_materia_inicial):-
   esMateriaInicial(sistemas_de_Representacion).

  % BO tests de materias que no son iniciales.

 test(fisica_ii_no_es_materia_inicial):-
   not(esMateriaInicial(fisica_II)).

 test(sistemas_operativos_no_es_materia_inicial):-
   not(esMateriaInicial(sitemas_operativos)).

 test(analisis_de_sistemas_no_es_materia_inicial):-
   not(esMateriaInicial(analisis_de_Sistemas)).

  % EO tests de materias que no son iniciales.

:- end_tests(materias_iniciales).

% Todas las materias necesarias para cursar una materia: tener en cuenta que las correlatividades son transitivas.

sonMateriasCorrelativas(Materia, MateriaCorrelativa) :-
  materia(Materia, _),
  materia(MateriaCorrelativa, _),
  esMateriaCorrelativa(Materia, MateriaCorrelativa).

sonMateriasCorrelativas(Materia, MateriaCorrelativaALaCorrelativa) :-
  materia(Materia, _),
  materia(MateriaCorrelativaALaCorrelativa, _),
  esMateriaCorrelativa(Materia, MateriaCorrelativa),
  sonMateriasCorrelativas(MateriaCorrelativa, MateriaCorrelativaALaCorrelativa).

% Tests

:- begin_tests(materias_correlativas).

  test(matematica_discreta_no_tiene_ninguna_correlativa, nondet) :-
    not(sonMateriasCorrelativas(matematica_Discreta, _)).

  test(fisica_ii_tiene_como_correlativa_directa_fisica_i, nondet) :-
    sonMateriasCorrelativas(fisica_II, fisica_I).

  test(administracion_gerencial_tiene_como_correlativa_indirecta_sistemas_y_organizaciones, nondet) :-
    sonMateriasCorrelativas(administracion_Gerencial, sistemas_y_Organizaciones).

  test(teoria_de_control_tiene_como_correlativa_quimica, nondet) :-
    sonMateriasCorrelativas(teoria_de_Control, quimica).

  test(teoria_de_control_tiene_como_correlativa_matematica_superior, nondet) :-
  sonMateriasCorrelativas(teoria_de_Control, matematica_Superior).

  test(teoria_de_control_tiene_como_correlativa_analisis_matematico_ii, nondet) :-
    sonMateriasCorrelativas(teoria_de_Control, analisis_Matematico_II).

  test(teoria_de_control_tiene_como_correlativa_analisis_matematico_i, nondet) :-
    sonMateriasCorrelativas(teoria_de_Control, analisis_Matematico_I).

  test(teoria_de_control_tiene_como_correlativa_algebra_y_geometria_analitica, nondet) :-
    sonMateriasCorrelativas(teoria_de_Control, algebra_y_Geometria_Analitica).

:- end_tests(materias_correlativas).

% Todas las materias que habilita una materia.
% Todas aquellas materias que para cursarlas es necesario haber cursado la materia en cuestión.
% Tener en cuenta la transitividad explicada en el punto anterior.

materiasQueHabilita(Materia, MateriaQueHabilita) :-
  materia(Materia, _),
  materia(MateriaQueHabilita, _),
  sonMateriasCorrelativas(MateriaQueHabilita, Materia).

% Tests

:- begin_tests(materias_habilitadas).

  test(comunicaciones_habilita_redes_de_informacion, nondet) :-
    materiasQueHabilita(comunicaciones, redes_de_Informacion).

  test(comunicaciones_habilita_proyecto_final, nondet) :-
    materiasQueHabilita(comunicaciones, proyecto_Final).

:- end_tests(materias_habilitadas).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Los Estudiantes

% Las materias cursadas de un estudiante.
% Tener en cuenta tanto las materias que posean una cursada aprobada como aquellas que hayan rendido libre.

% Nota entre 6 y 10
notaDeAprobacion(Nota) :-
  between(6, 10, Nota).

% Nota entre 8 y 10
notaDePromocion(Nota) :-
  between(8, 10, Nota).

%materiaFirmada(Estudiante, Materia) :-
%  materia(Materia, _),
%  cursada(Estudiante, Materia, Nota),
%  between(6, 10, Nota).

%materiaFirmada(Estudiante, Materia) :-
%  materia(Materia, _),
%  libre(Estudiante, Materia, Nota),
%  between(6, 10, Nota).

% No repite lógica de esta manera
materiaFirmada(Estudiante, Materia) :-
  materia(Materia, _),
  (
    cursada(Estudiante, Materia, Nota);
    libre(Estudiante, Materia, Nota)
  ),
  notaDeAprobacion(Nota).

%cursada(Estudiante, Materia, Nota).
%libre(Estudiante, Materia, Nota).
%final(Estudiante, Materia, Nota).

cursada(vero, analisis_Matematico_I, 8).
cursada(vero, algebra_y_Geometria_Analitica, 8).
cursada(vero, matematica_Discreta, 8).
cursada(vero, sistemas_y_Organizaciones, 8).
cursada(vero, algoritmos_y_Estructuras_de_Datos, 8).
cursada(vero, arquitectura_de_Computadoras, 8).
cursada(vero, ingenieria_y_Sociedad, 8).
cursada(vero, quimica, 8).
cursada(vero, fisica_I, 8).
cursada(vero, ingles_I, 8).
cursada(vero, sistemas_de_Representacion, 8).
cursada(alan, sistemas_y_Organizaciones, 6).
cursada(alan, algoritmos_y_Estructuras_de_Datos, 7).
cursada(alan, analisis_Matematico_I, 6).
cursada(alan, analisis_de_Sistemas, 2).
cursada(alan, analisis_de_Sistemas, 9).
cursada(alan, fisica_I, 2).

final(alan, sistemas_y_Organizaciones, 4).

libre(vero, ingles_II, 10).
libre(alan, ingles_I, 2).

aproboFinal(Estudiante, Materia) :-
  materia(Materia, _),
  final(Estudiante, Materia, Nota),
  notaDeAprobacion(Nota).

aproboFinalLibre(Estudiante, Materia) :-
  materia(Materia, _),
  libre(Estudiante, Materia, Nota),
  notaDeAprobacion(Nota).

promocionoMateria(Estudiante, Materia) :-
  materia(Materia, _),
  cursada(Estudiante, Materia, Nota),
  notaDePromocion(Nota).

% materiaAprobada(Estudiante, Materia, Modalidad).
materiaAprobada(Estudiante, Materia, libre) :-
  materia(Materia, _),
  materiaFirmada(Estudiante, Materia),
  aproboFinalLibre(Estudiante, Materia).

materiaAprobada(Estudiante, Materia, final) :-
  materia(Materia, _),
  materiaFirmada(Estudiante, Materia),
  aproboFinal(Estudiante, Materia).

materiaAprobada(Estudiante, Materia, promocion) :-
  materia(Materia, _),
  materiaFirmada(Estudiante, Materia),
  promocionoMateria(Estudiante, Materia).

% Tests

:- begin_tests(materias_cursadas).

  test(vero_firmo_matematica_discreta, nondet) :-
    materiaFirmada(vero, matematica_Discreta).

  test(alan_no_firmo_fisical_i, nondet) :-
    not(materiaFirmada(alan, fisica_I)).

  test(vero_no_firmo_proyecto_final_por_nunca_haberla_cursado, nondet) :-
    not(materiaFirmada(vero, proyecto_Final)).

  test(vero_firmo_ingles_ii_por_haber_aprobado_final_libre, nondet) :-
    materiaFirmada(vero, ingles_II).

  test(alan_no_firmo_ingles_i_por_haber_desaprobado_final_libre, nondet) :-
    not(materiaFirmada(alan, ingles_I)).

  test(alan_firmo_sistemas_y_organizaciones, nondet) :-
    materiaFirmada(alan, sistemas_y_Organizaciones).

  test(alan_firmo_algoritmos_y_estructuras_de_datos, nondet) :-
    materiaFirmada(alan, algoritmos_y_Estructuras_de_Datos).

  test(alan_firmo_analisis_Matematico_i, nondet) :-
    materiaFirmada(alan, analisis_Matematico_I).

  test(alan_firmo_analisis_de_sistemas, nondet) :-
    materiaFirmada(alan, analisis_de_Sistemas).

:- end_tests(materias_cursadas).

:- begin_tests(materias_aprobadas).

  test(vero_aprobo_ingles_ii_rindiendo_final_libre, nondet) :-
    materiaAprobada(vero, ingles_II, libre).

  test(alan_desaprobo_ingles_i_rindiendo_final_libre, nondet) :-
    not(materiaAprobada(alan, ingles_I, libre)).

  test(vero_promociono_quimica, nondet) :-
    materiaAprobada(vero, quimica, promocion).

  test(vero_no_aprobo_proyecto_final, nondet) :-
    not(materiaAprobada(vero, proyecto_Final, _)).

  test(alan_no_aprobo_analisis_matematico_i, nondet) :-
    not(materiaAprobada(alan, analisis_Matematico_I, _)).

  test(alan_aprobo_analisis_de_sistemas, nondet) :-
    materiaAprobada(alan, analisis_de_Sistemas, _).

:- end_tests(materias_aprobadas).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Modalidades

% anual(Materia, Anio).
% cuatrimestral(Materia, Anio, Cuatrimestre).
% cursoDeVerano(Materia, Anio, Mes).

%cursada(Estudiante, anual(Materia, Anio), Nota).
%cursada(Estudiante, cuatrimestral(Materia, Anio, Cuatrimestre), Nota).
%cursada(Estudiante, cursoDeVerano(Materia, Anio, Mes), Nota).

% En qué año cursó un estudiante una materia.
% Atención que las de verano son del año anterior.

anioDeLaCursada(Estudiante, Materia, Anio) :-
  cursada(Estudiante, anual(Materia, Anio), _).

anioDeLaCursada(Estudiante, Materia, Anio) :-
  cursada(Estudiante, cuatrimestral(Materia, Anio, _), _).

anioDeLaCursada(Estudiante, Materia, Anio) :-
  cursada(Estudiante, cursoDeVerano(Materia, AnioCursoDeVerano, _), _),
  Anio is AnioCursoDeVerano - 1.

% Las materias que recursó un estudiante.
% Se considera que se recursó una materia si la cursó en más de una ocasión.

recurso(Estudiante, Materia):- % Materia anual recursada anual
  cursada(Estudiante, anual(Estudiante, Materia, Anio), _),
  cursada(Estudiante, anual(Estudiante, Materia, OtroAnio), _),
  Anio \= OtroAnio.

recurso(Estudiante, Materia):- % Materia anual/cuatrimestral recursada en verano
  (
    cursada(Estudiante, anual(Estudiante, Materia, _), _);
    cursada(Estudiante, cuatrimestral(Materia, _, _), _)
  ),
  cursada(Estudiante, cursoDeVerano(Materia, _, _), _).

recurso(Estudiante, Materia):- % Materia anual recursada cuatrimestral
  cursada(Estudiante, anual(Estudiante, Materia, Anio), _),
  cursada(Estudiante, cuatrimestral(Materia, OtroAnio, _), _),
  OtroAnio \= Anio.

recurso(Estudiante, Materia):- % Materia cuatrimestral recursada cuatrimestral
  cursada(Estudiante, cuatrimestral(Materia, Anio, Mitad), _),
  (
    (
      cursada(Estudiante, cuatrimestral(Materia, OtroAnio, OtraMitad), _),
      (
        OtraMitad \= Mitad;
        OtroAnio \= Anio
      )
    )
  ).

recurso(Estudiante, Materia):- % Materia cursada en verano recursada en verano
  cursada(Estudiante, cursoDeVerano(Materia, Anio, Mes), _),
  cursada(Estudiante, cursoDeVerano(Materia, OtroAnio, OtroMes), _),
  (
    Anio \= OtroAnio;
    OtroMes \= Mes
  ).

% Casos de prueba

% Modelar un estudiante de prueba con las siguientes cursadas (si hace falta más información inventarla):

% Cursó Sistemas y Organizaciones de forma anual en 2015
cursada(chano, anual(sistemas_y_Organizaciones, 2015), 7).

% Cursó Química el cuatrimestre primero del 2015
cursada(chano, cuatrimestral(quimica, 2015, primero), 3).

% Volvió a cursar Química el segundo cuatrimestre del 2015.
cursada(chano, cuatrimestral(quimica, 2015, segundo), 8).

% Cursó Física I en el curso de verano del año calendario 2016.
cursada(chano, cursoDeVerano(fisica_I, 2016, febrero), 9).

% Tests

:- begin_tests(anio_de_cursada).

  test(chano_curso_sistemas_y_organizaciones_anual_2015, nondet):-
    cursada(chano, anual(sistemas_y_Organizaciones, 2015), _).

  test(chano_curso_quimica_cuatrimestral_en_2015, nondet):-
    cursada(chano, cuatrimestral(quimica, 2015, _), _).

  test(chano_curso_fisica_i_en_el_curso_de_verano_del_anio_calendario_2016, nondet):-
    cursada(chano, cursoDeVerano(fisica_I, 2016, _), _).

:- end_tests(anio_de_cursada).

:- begin_tests(materias_recursadas).

  test(chano_recurso_quimica, nondet):-
    recurso(chano, quimica).

  test(vero_no_recurso_nada, nondet):-
    not(recurso(vero, _)).

:- end_tests(materias_recursadas).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Perfiles de estudiantes

% Cursada cuatrimestral

sinDescanso(Estudiante) :- % cursó primer cuatrimestre, recursó cuatrimestre segundo del mismo año.
  recurso(Estudiante, Materia),
  cursada(Estudiante, cuatrimestral(Materia, Anio, primero), _),
  cursada(Estudiante, cuatrimestral(Materia, Anio, segundo), _).

sinDescanso(Estudiante) :- % cursó segundo cuatrimestre, recursó cuatrimestre primero del siguiente año.
  recurso(Estudiante, Materia),
  cursada(Estudiante, cuatrimestral(Materia, Anio, segundo), _),
  cursada(Estudiante, cuatrimestral(Materia, AnioSiguiente, primero), _),
  AnioSiguiente is Anio + 1.

sinDescanso(Estudiante) :- % cursó primero/segundo cuatrimestre, recursó anual el siguiente año.
  recurso(Estudiante, Materia),
  cursada(Estudiante, cuatrimestral(Materia, Anio, _), _),
  cursada(Estudiante, anual(Materia, AnioSiguiente), _),
  AnioSiguiente is Anio + 1.

sinDescanso(Estudiante) :- % cursó segundo cuatrimestre, recursó curso de verano del mismo año.
  recurso(Estudiante, Materia),
  cursada(Estudiante, cuatrimestral(Materia, Anio, segundo), _),
  cursada(Estudiante, cursoDeVerano(Materia, AnioSiguiente, _), _),
  AnioSiguiente is Anio + 1.

% Cursada anual

sinDescanso(Estudiante) :- % cursó anual un año, recursó anual sig. año.
  recurso(Estudiante, Materia),
  cursada(Estudiante, anual(Materia, Anio), _),
  cursada(Estudiante, anual(Materia, AnioSiguiente), _),
  AnioSiguiente is Anio + 1.

sinDescanso(Estudiante) :- % cursó anual un año, recursó cuatrimestral sig. año, cuatrimestre primero.
  recurso(Estudiante, Materia),
  cursada(Estudiante, anual(Materia, Anio), _),
  cursada(Estudiante, cuatrimestral(Materia, AnioSiguiente, primero), _),
  AnioSiguiente is Anio + 1.

sinDescanso(Estudiante) :- % cursó anual un año, recursó curso de verano del mismo año.
  recurso(Estudiante, Materia),
  cursada(Estudiante, anual(Materia, Anio), _),
  cursada(Estudiante, cursoDeVerano(Materia, AnioSiguiente, _), _),
  AnioSiguiente is Anio + 1.

% Cursada De Verano

sinDescanso(Estudiante) :- % cursó en curso de verano un año, recursó curso anual.
  recurso(Estudiante, Materia),
  cursada(Estudiante, cursoDeVerano(Materia, Anio, _), _),
  cursada(Estudiante, anual(Materia, Anio), _).

sinDescanso(Estudiante) :- % cursó en curso de verano un año, recursó curso cuatrimestral, cuatrimestre primero.
  recurso(Estudiante, Materia),
  cursada(Estudiante, cursoDeVerano(Materia, Anio, _), _),
  cursada(Estudiante, cuatrimestral(Materia, Anio, primero), _).

% Invictus: Nunca recursó una materia.
invictus(Estudiante) :-
  not(recurso(Estudiante, _)).

% Repechaje: Cursó la materia de manera anual y no aprobó, pero como venía más o menos,
% prefirió volver a cursarla en el primer cuatrimestre del próximo año, donde la promocionó.
repechaje(Estudiante):-
  cursada(Estudiante, anual(Materia, Anio), NotaAnual),
  not(notaDeAprobacion(NotaAnual)),
  cursada(Estudiante, cuatrimestral(Materia, AnioSiguiente, primero), NotaCuatrimestral),
  notaDePromocion(NotaCuatrimestral),
  AnioSiguiente is Anio + 1.

% Buenas cursadas: Promocionó todas las materias que cursó.
buenasCursadas(Estudiante):-
  not(libre(Estudiante, _, _)),
  forall(
    cursada(Estudiante, _, Nota),
    notaDePromocion(Nota)
  ).

% Se lo que hiciste el verano pasado: Desde que empezó a cursar hasta que dejó de hacerlo,
% todos los veranos cursó alguna materia. Considerar los años del ciclo lectivo, no calendario,
% y que tenemos información de ciclos lectivos completos, nunca parciales.
cursoAlgunaMateria(Estudiante, Anio) :-
  cursada(Estudiante, anual(_, Anio), _);
  cursada(Estudiante, cuatrimestral(_, Anio, _), _).

hizoCursoDeVerano(Estudiante, Anio) :-
  AnioCursoDeVerano is Anio + 1,
  cursada(Estudiante, cursoDeVerano(_, AnioCursoDeVerano, _), _).

seLoQueHicisteElVeranoPasado(Estudiante) :-
  forall(
    cursoAlgunaMateria(Estudiante, Anio),
    hizoCursoDeVerano(Estudiante, Anio)
  ).

% También se desea saber aquellos estudiantes que poseen un único perfil,
% o sea que cumple las condiciones de solamente un perfil descrito (no importa cuál).

unicoPerfil(Estudiante):-
  seLoQueHicisteElVeranoPasado(Estudiante) #
  sinDescanso(Estudiante) #
  buenasCursadas(Estudiante) #
  invictus(Estudiante) #
  repechaje(Estudiante).

% Para estudiante con muchas recursadas:

% Cursó Química con 2 de forma anual en 2016
cursada(jose, anual(quimica, 2016), 2).
% Volvió a cursar Química con 3 en el primer cuatrimestre del 2017
cursada(jose, cuatrimestral(quimica, 2017, primero), 3).
% Volvió a cursar Química con 4 en el segundo cuatrimestre del 2017
cursada(jose, cuatrimestral(quimica, 2017, segundo), 4).
% Volvió a cursar Química con 5 de forma anual en 2018
cursada(jose, anual(quimica, 2018), 5).
% Cursó Física I con 2 en el verano del año calendario 2018
cursada(jose, cursoDeVerano(fisica_I, 2018, febrero), 2).
% Volvió a cursar Física I con 2 de forma anual en 2018
cursada(jose, anual(fisica_I, 2018), 2).

% Para estudiante con algunas recursadas:

% Cursó Química con 2 de forma anual en 2016
cursada(marcos, anual(quimica, 2016), 2).
% Volvió a cursar Química con 3 en el segundo cuatrimestre del 2017
cursada(marcos, cuatrimestral(quimica, 2017, segundo), 3).
% Cursó Física I con 2 de forma anual en 2017
cursada(marcos, anual(fisica_I, 2017), 2).
% Volvió a cursar Física I con 10 en el primer cuatrimestre del 2018
cursada(marcos, cuatrimestral(fisica_I, 2018, primero), 10).

% Para estudiante veraniego:

% Cursó Química con 6 de forma anual en 2016
cursada(diego /* el veraniego */, anual(quimica, 2016), 6).
% Cursó Física I con 6 en el verano del año calendario 2017
cursada(diego /* el veraniego */, cursoDeVerano(fisica_I, 2017, febrero), 6).
% Cursó Matemática discreta con 2 de forma anual en 2017
cursada(diego /* el veraniego */, anual(matematica_Discreta, 2017), 2).
% Volvió a cursar Matemática discreta con 8 en el verano del año calendario 2018
cursada(diego /* el veraniego */, cursoDeVerano(matematica_Discreta, 2018, febrero), 8).

% Para estudiante atr:

% Cursó Química con 10 en el primer cuatrimestre del 2016
cursada(agustina, cuatrimestral(quimica, 2016, primero), 10).
% Cursó Física I con 10 en el segundo cuatrimestre del 2016
cursada(agustina, cuatrimestral(fisica_I, 2016, segundo), 10).

% Pepo, recursante de analisis de sistemas.

cursada(pepo, cuatrimestral(analisis_de_Sistemas, 2015, primero), 2).
cursada(pepo, cuatrimestral(analisis_de_Sistemas, 2015, segundo), 6).

% Tests

:- begin_tests(estudiantes_sin_descanso).

  test(estudiante_con_muchas_recursadas_no_descansa, nondet) :-
    sinDescanso(jose).

  test(estudiante_con_algunas_recursadas_descansa, nondet) :-
    not(sinDescanso(marcos)).

:- end_tests(estudiantes_sin_descanso).

% Tests

:- begin_tests(estudiantes_invictus).

  test(vero_esta_invicta) :-
    invictus(vero).

  test(pepo_no_esta_invicto) :-
    not(invictus(pepo)).

:- end_tests(estudiantes_invictus).

% Tests

:- begin_tests(estudiantes_repechaje).

  test(estudiante_con_algunas_recursadas_va_a_repechaje) :-
    repechaje(marcos).

  test(vero_no_va_a_repechaje) :-
    not(repechaje(vero)).

:- end_tests(estudiantes_repechaje).

% Tests

:- begin_tests(estudiantes_buena_cursada).

  test(estudiante_atr_tiene_buenas_cursadas) :-
    buenasCursadas(agustina).

  test(vero_no_tiene_buenas_cursadas) :-
    not(buenasCursadas(vero)).

:- end_tests(estudiantes_buena_cursada).

% Tests

:- begin_tests(se_lo_que_hiciste_el_verano_pasado).

  test(estudiante_veraniego_curso_todos_los_veranos_de_su_carrera) :-
    seLoQueHicisteElVeranoPasado(diego).

  test(estudiante_con_muchas_recursadas_no_curso_todos_los_veranos_de_su_carrera) :-
    not(seLoQueHicisteElVeranoPasado(jose)).

:- end_tests(se_lo_que_hiciste_el_verano_pasado).

% Tests

:- begin_tests(unico_perfil).

  test(nadie_tiene_un_unico_perfil) :-
    not(unicoPerfil(_)).

:- end_tests(unico_perfil).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Desempeño académico

% Obtener el desempeño de cursada de un estudiante,
% que es el promedio de las valoraciones de todas las cursadas que tuvo.

desempenioCursada(Estudiante, Desempenio) :-
  desempenioAnual(Estudiante, DesempenioAnual),
  desempenioCuatrimestral(Estudiante, DesempenioCuatrimestral),
  desempenioVeranos(Estudiante, DesempenioDeVerano),
  Desempenio is DesempenioAnual + DesempenioCuatrimestral + DesempenioDeVerano.

% Anuales:  Se considera la nota de las cursadas.

desempenioAnual(Estudiante, DesempenioAnual) :-
  findall(Nota, cursada(Estudiante, anual(_,_), Nota), Notas),
  sumlist(Notas, DesempenioAnual).

numeroDeCuatrimestre(primero, 1).
numeroDeCuatrimestre(segundo, 2).

% Cuatrimestrales: Se considera la nota de cursada menos el número de cuatrimestre.

desempenioCuatrimestral(Estudiante, DesempenioCuatrimestral) :-
  findall(Nota, cursada(Estudiante, cuatrimestral(_,_,_), Nota), Notas),
  findall(Cuatrimestre, cursada(Estudiante, cuatrimestral(_,_,Cuatrimestre), _), Cuatrimestres),
  maplist(numeroDeCuatrimestre, Cuatrimestres, NumerosDeCutrimestres),
  sumlist(Notas, TotalNotas),
  sumlist(NumerosDeCutrimestres, TotalCuatrimestral),
  DesempenioCuatrimestral is TotalNotas - TotalCuatrimestral.

% De verano: Se considera la mitad de la nota de cursada,
% excepto si la suma del año de la cursada más la cantidad de letras del mes son pares,
% en cuyo caso se considera la totalidad de la nota.

foldAnioMesIntoValorDecisorio([Anio, Mes], ValorDecisorio) :-
  atom_length(Mes, LargoMes),
  ValorDecisorio is Anio + LargoMes.

esPar(X) :-
  0 is mod(X, 2).

calcularDesempenioDeVerano(ValorDecisorio, Nota, Nota) :-
  esPar(ValorDecisorio).

calcularDesempenioDeVerano(ValorDecisorio, Nota, Desempenio) :-
  not(esPar(ValorDecisorio)),
  Desempenio is Nota / 2.

getDesempenioDeVerano([], [], 0).

getDesempenioDeVerano([ValorDecisorio | TailValoresDecisorios], [Nota | TailNotas], DesempenioDeVerano) :-
  calcularDesempenioDeVerano(ValorDecisorio, Nota, DesempenioParcial),
  getDesempenioDeVerano(TailValoresDecisorios, TailNotas, DesempenioTotal),
  DesempenioDeVerano is DesempenioTotal + DesempenioParcial.

desempenioVeranos(Estudiante, DesempenioDeVerano) :-
  findall(Nota, cursada(Estudiante, cursoDeVerano(_,_,_), Nota), Notas),
  findall([Anio, Mes], cursada(Estudiante, cursoDeVerano(_,Anio,Mes), _), AniosYMeses),
  maplist(foldAnioMesIntoValorDecisorio, AniosYMeses, ValoresDecisorios),
  getDesempenioDeVerano(ValoresDecisorios, Notas, DesempenioDeVerano).

% Tests

:- begin_tests(desempenio_academico).

  test(diego_tiene_desempenio_anual_igual_a_8, nondet) :-
    desempenioAnual(diego, 8).

  test(diego_tiene_desempenio_cuatrimestral_igual_a_0, nondet) :-
    desempenioCuatrimestral(diego, 0).

  test(diego_tiene_desempenio_de_veranos_igual_a_10, nondet) :-
    desempenioVeranos(diego, 10).

  test(diego_tiene_desempenio_de_cursada_igual_a_18, nondet) :-
    desempenioCursada(diego, 18).

  test(agustina_tiene_desempenio_anual_igual_a_0, nondet) :-
    desempenioAnual(agustina, 0).

  test(agustina_tiene_desempenio_cuatrimestral_igual_a_17, nondet) :-
    desempenioCuatrimestral(agustina, 17).

  test(agustina_tiene_desempenio_de_veranos_igual_a_0, nondet) :-
    desempenioVeranos(agustina, 0).

  test(agustina_tiene_desempenio_de_cursada_igual_a_17, nondet) :-
    desempenioCursada(agustina, 17).

:- end_tests(desempenio_academico).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
