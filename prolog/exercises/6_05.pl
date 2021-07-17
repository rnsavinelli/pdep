%Si es necesario, Prolog también puede hacer cuentas por nosotros. Por ejemplo:

%caloriasHamburguesa(PesoEnGramos, Calorias) :-
%    Calorias is PesoEnGramos * 2.2 .
%Con lo que podemos consultar lo siguiente:

%? caloriasHamburguesa(84, 184.8).
%yes

%? caloriasHamburguesa(84, 200).
%no

%Veamos si queda claro: escribí un predicado cuantaNaftaConsume/2 que relaciona la longitud de un viaje (en kilometros) en auto con la cantidad de nafta que consume . Estimar que se consumen 40 litros de nafta cada 600 kilómetros.

cuantaNaftaConsume(DistanciaEnKm, NaftaConsumida) :-
  NaftaConsumida is 40 * (DistanciaEnKm / 600).
