%¡Hora de repasar funcional! Sabemos que:

%la función siguiente toma un entero y devuelve un entero
%la funcion anterior toma un entero y devuelve un entero
%la función longitud toma una lista y devuelve un entero
%y que la composición funcional:
%   toma una función de tipo b->c
%   otra función de tipo a->b
%   y devuelve otra funcion, de tipo a->c

%Sabiendo esto, queremos saber el tipo de una composición, utilizando un predicado que se usa así:

%? tipoDeLaComposicion(siguiente, anterior, entero, entero).
%yes  % porque si hago (siguiente . anterior),
%     % tengo una función que va de entero en entero

%? tipoDeLaComposicion(siguiente, longitud, lista, entero).
%yes  % porque si hago (siguiente . longitud),
%     % tengo una función que va de lista en entero

%? tipoDeLaComposicion(longitud, longitud, lista, entero).
%no   % porque (longitd . longitud) no tipa

%? tipoDeLaComposicion(anterior, anterior, lista, entero).
%no   % porque si bien (anterior . anterior) tipa,
%     % no devuelve una función que va de lista en entero

%Escribí el predicado tipoDeLaComposicion

%funcion(Nombre, TipoDatoEntrada, TipoDatoSalida)
funcion(siguiente, entero, entero).
funcion(anterior, entero, entero).
funcion(longitud, lista, entero).

%tipoDeLaComposicion(FuncionF, FuncionG, TipoDatoEntrada, TipoDatoSalida)
tipoDeLaComposicion(F, G, TipoDatoEntrada, TipoDatoSalida) :-
  funcion(F, TipoDatoEnlace, TipoDatoSalida),
  funcion(G, TipoDatoEntrada, TipoDatoEnlace).
