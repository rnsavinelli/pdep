%Se está organizando una fiesta para una cátedra. Para saber quién puede ir a la fiesta y quién no, se establece quién es alumno de quién. También se tiene información de otras personas, que no son de la facultad. La información es esta:

%Luisa y Juan son alumnos de Daniel.
%Ana es alumna de Luisa.
%Diana y Nahuel son alumnos de Nico.
%Tamara es alumna de Nahuel.
%Claudio y José son alumnos de Rubén.
%Alvaro es alumno de José y de Luisa.
%Brad, Leo y Johnny son carilindos.
%Luciano y Lautaro son simpáticos.

%A la fiesta pueden ir: Nico, Daniel, y los alumnos de Daniel que no tengan alumnos. Como las chicas insistieron, también pueden ir los carilindos.

%Escribí una base de conocimiento que permita responder las siguientes preguntas:

%carilindo/1 y simpatico/1: dicen si alguien es carilindo o simpático, respectivamente
%alumno/2: que relaciona a un alumno con su docente (ojo con el orden de los argumentos!)
%puedeIr/1, que se verifica para una persona si ésta puede ir a la fiesta

alumno(luisa, daniel).
alumno(juan, daniel).

alumno(ana, luisa).

alumno(diana, nico).
alumno(nahuel, nico).

alumno(tamara, nahuel).

alumno(claudio, ruben).
alumno(jose, ruben).

alumno(alvaro, jose).
alumno(alvaro, luisa).

carilindo(brad).
carilindo(leo).
carilindo(johnny).

simpatico(luciano).
simpatico(lautaro).

puedeIr(nico).
puedeIr(daniel).

puedeIr(Persona) :-
  (alumno(Persona, daniel), not(alumno(_, Persona)));
  carilindo(Persona).
