%Para un proyecto de desarrollo de software se tiene una base de conocimientos con los siguientes hechos:

tarea(login, 80, programador). % La tarea login tarda 80 horas y debe ser realizada por el programador
tarea(cacheDistribuida, 120, arquitecto).
tarea(pruebasPerformance, 100, tester).
tarea(tuning, 30, arquitecto).

precede(cacheDistribuida, pruebasPerformance). % La tarea pruebasDePerformance solo puede comenzar una vez que cacheDistribuida finalice
precede(pruebasPerformance, tuning).

realizada(login). % La tarea login ya se realizo

%anterior/2

%Relaciona dos tareas A y B si estas deben realizarse en un orden específico, ya sea por una dependencia directa o indirecta.

%?- anterior(T, tuning).
%T = pruebasPerformance; (-> dependencia directa, porque pruebasPerformance precede a tuning)
%T = cacheDistribuida; (-> dependencia indirecta, a través de pruebasPerformance)

%meFaltaPara/2
%Relaciona una tarea con otra que debe ser terminada antes de poder comenzar con la misma y no ha sido realizada todavía.

%?- meFaltaPara(tuning, Faltante).
%Faltante = pruebasPerformance;
%Faltante = cacheDistribuida.

%puedoHacer/1
%Indica si una tarea puede ser realizada. Una tarea puede ser realizada cuando no fue realizada ya y todas sus precedentes han sido realizadas.

%Se espera que los 3 predicados sean inversibles y que puedoHacer/1 use meFaltaPara/2.

%dependencia directa
anterior(TareaA, TareaB) :-
  tarea(TareaA, _, _),
  tarea(TareaB, _, _),
  precede(_, TareaB),
  precede(TareaA, TareaB).

%dependencia indirecta
anterior(TareaA, TareaB) :-
  tarea(TareaA, _, _),
  tarea(TareaB, _, _),
  precede(TareaA, _),
  precede(_, TareaB),
  precede(TareaA, T),
  precede(T, TareaB).

meFaltaPara(TareaA, TareaB) :-
  anterior(TareaB, TareaA),
  not(realizada(TareaB)).

puedoHacer(Tarea) :-
  tarea(Tarea, _, _),
  not(realizada(Tarea)),
  not(meFaltaPara(Tarea, _)).
