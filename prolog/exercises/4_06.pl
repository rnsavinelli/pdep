%Se dice que una reunión puede iluminarse con un color si entre los asistentes a la reunión hay una pareja a quienes les atrae el color.

%Incluí en el programa anterior la siguiente información:

%Mabel, Ana, Adrián y Pablo asistirán a la reunión del viernes.
%Mara, Mabel, Adrián y Juan asistirán a la reunión del sábado.
%Las personas mayores y Juan asistirán a la reunión del domingo.
%Y desarrollá puedeIluminarseCon/2, que relaciona un día de reunión y un color, cuando ésta puede ser iluminada con dicho color.

%Asumir que los siguientes predicados ya existen:

%atraeA: relaciona una persona con un color
%esMayor
%mujer, varon

asistiraAReunion(mabel, viernes).
asistiraAReunion(ana, viernes).
asistiraAReunion(adrian, viernes).
asistiraAReunion(pablo, viernes).

asistiraAReunion(mara, sabado).
asistiraAReunion(mabel, sabado).
asistiraAReunion(adrian, sabado).
asistiraAReunion(juan, sabado).

asistiraAReunion(juan, domingo).
asistiraAReunion(Persona, domingo) :-
  esMayor(Persona).

puedeIluminarseCon(viernes, verde).
puedeIluminarseCon(sabado, amarillo).
puedeIluminarseCon(domingo, rojo).
