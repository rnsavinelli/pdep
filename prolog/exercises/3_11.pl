%Concentrémonos en esta condición:

%forall(quiereIr(Persona, Destino), quedaEn(Destino, Zona))
%Si expresamos este predicado en términos lógicos, nos queda:

%∀ Destino : quiereIr(Persona, Destino) => quedaEn(Destino, Zona)
%Lo cual se lee como para todo destino, si la persona quiere ir a él, le queda cerca, que no es más que la formalización de lo que veníamos diciendo.

%Sin embargo, ¿Cómo se dio cuenta Prolog de la variable que cuantificamos universalmente es Destino? Es decir, ¿por qué no interpretó, por ejemplo, para toda persona, si el destino es de interés para la persona, le queda cerca?:

%∀ Persona : quiereIr(Persona, Destino) => quedaEn(Destino, Zona)
%La clave acá está en las variables libres, por lo que tenemos que mirar toda la cláusula:

%estaBienUbicado(Persona) :-
%  viveEn(Persona, Zona),
%  forall(quiereIr(Persona, Destino), quedaEn(Destino, Zona)). % Destino es una variable libre: no viene como
                                                               % argumento ni es instanciada por ninguna condición anterior

%Dentro de un forall, lo que cuantificamos universalmente son las variables libres.

%Veamos si se entiende: escribí un predicado destinoAccesible/1 que nos diga si llegan fácil todas las personas que quieran ir a éste. Recordá que existe el predicado llegaFacil/2 que relaciona una persona y un destino.


destinoAccesible(Destino) :-
  forall(quiereIr(Persona, Destino), llegaFacil(Persona, Destino)).
