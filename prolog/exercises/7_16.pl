%tareaRiesgosa/1
%Siguiendo con las tareas, queremos saber si una tarea es riesgosa. Consideramos como riesgosas todas las tareas de 40 o más horas que aún no han sido realizadas.

%Por ejemplo, con una base de conocimientos como la siguiente:

tarea(login, 80, programador).
tarea(cacheDistribuida, 120, arquitecto).
tarea(tuning, 30, arquitecto).

realizada(login).

%Sólo la tarea cacheDistribuida sería riesgosa. El predicado tareaRiesgosa/1 debe ser inversible.

tareaRiesgosa(Tarea) :-
  tarea(Tarea, Duracion, _),
  not(realizada(Tarea)),
  Duracion >= 40.
