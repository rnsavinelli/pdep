%Entonces, ¿programar en Prolog se trata de escribir una base de conocimiento que dice aquello que sabemos del mundo?

%En parte, sí. En nuestra base de conocimiento escribiremos aquellas cosas que sabemos que son verdaderas: los hechos.

%Así, por ejemplo, es un hecho que el indiviuo drHouse, es un personajeDeFiccion.

%Y en una base de conocimiento puede haber varios hechos, incluso hechos de diferente nombre:

cancion(soloLePidoADios).
cancion(jijiji).

recital(deLasBandasEternas).

%Veamos si queda claro: escribi una base de conocimiento sobre paises. Los siguientes son hechos:

%Argentina es un pais
%Uruguay es un pais
%Santa Cruz es una provincia
%Canelones es un departamento

pais(argentina).
pais(uruguay).

provincia(santaCruz).

departamento(canelones).
