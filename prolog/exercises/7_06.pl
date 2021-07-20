%En funcional, decimos que

%si aplicás una función con todos sus argumentos, la estás aplicando totalmente.
%si lo hacés con menos, las estás aplicando parcialmente.
%si no le pasas argumentos, no la estás aplicando
%Sabiendo esto, queremos un predicado que nos diga que opciones tenemos para usar una función: tipoDeAplicacion/3, que relacione la aridad de una función, una cantidad de argumentos pasados, y lo que estoy haciendo:

%? tipoDeAplicacion(8, 7, parcial).
%yes % porque si a una función de 8 parametros
%    % la aplico con 7, es una aplicación parcial

%? tipoDeAplicacion(4, 4, total).
%yes % porque si a una función de 4 parametros
%    % la aplico con 4, es una aplicación total

%? tipoDeAplicacion(2, 0, Tipo).
%Tipo = sinAplicar.
%    % porque si a una función de 2 parametros
%    % no le paso ninguno, no la estoy aplicando

%? tipoDeAplicacion(4, CantidadDeArgumentos, parcial)
%CantidadDeArgumentos = 3;
%CantidadDeArgumentos = 2;
%CantidadDeArgumentos = 1
%    % porque a una función de 4 parametros la puedo aplicar
%    % parcialmente con 1, 2 ó 3 argumentos

%Desarrollá el predicado tipoDeAplicacion/3

tipoDeAplicacion(Aridad, Aridad, total) :-
  Aridad >= 0.

tipoDeAplicacion(Aridad, 0, sinAplicar) :-
  Aridad >= 0.

tipoDeAplicacion(Aridad, CantidadDeArgumentos, parcial) :-
  Aridad > 2,
  High is Aridad - 1,
  between(1, High, CantidadDeArgumentos).
