%En la casa de bebidas ahora queremos saber el precio de venta de un producto, que depende del costo de la bebida, y de a quíen se la vendemos.

%Las ventas se realizan a comerciantes y a particulares. Para los comerciantes, el cálculo del precio es así:

%a las aguas se les recarga un 25%.
%a las gaseosas no se les recarga nada
%a las bebidas alcoholicas se les recarga un 30%
%Y para los particulares, el cálculo del precio es así:

%a las aguas minerales se les recarga un 30%
%a las gaseosas se les recarga un 40%
%a las bebidas alcohólicas nacionales se les recarga un 60%.
%a las bebidas alcohólicas importadas se les recarga un 70%.
%Desarrollar el predicado calcularPrecio/3 que relaciona a un cliente, una bebida y un precio de venta. Ejemplo de uso:

%calcularPrecio(luisa, trapiche, Precio).
%Precio = ...

%Nota: Considerar que los siguientes predicados ya se encuentran definidos:

%esImportada/1, esNacional/1
%esAgua/1, esGaseosa/1
%esAlcoholica/1
%costo/2: que relaciona a una bebida con su costo
%esParticular/1, esComerciante/1

%Notar que el cálculo de la forma siempre está basado en obtener un recargo sobre el costo original. Para evitar repetición de lógica, se sugiere definir y usar convenientemente un predicado recargo/3, que relacione al cliente, bebida y recargo.

recargo(Costo, Recargo, Resultado) :-
  Resultado is Costo * (1 + (Recargo/100)).

% Particulares
calcularPrecio(Cliente, Bebida, Precio) :-
  esParticular(Cliente),
  esAgua(Bebida),
  costo(Bebida, Costo),
  recargo(Costo, 30, Precio).

calcularPrecio(Cliente, Bebida, Precio) :-
  esParticular(Cliente),
  esGaseosa(Bebida),
  costo(Bebida, Costo),
  recargo(Costo, 40, Precio).

calcularPrecio(Cliente, Bebida, Precio) :-
  esParticular(Cliente),
  esAlcoholica(Bebida),
  esNacional(Bebida),
  costo(Bebida, Costo),
  recargo(Costo, 60, Precio).

calcularPrecio(Cliente, Bebida, Precio) :-
  esParticular(Cliente),
  esAlcoholica(Bebida),
  esImportada(Bebida),
  costo(Bebida, Costo),
  recargo(Costo, 70, Precio).


% Comerciante
calcularPrecio(Cliente, Bebida, Precio) :-
  esComerciante(Cliente),
  esAgua(Bebida),
  costo(Bebida, Costo),
  recargo(Costo, 25, Precio).

calcularPrecio(Cliente, Bebida, Precio) :-
  esComerciante(Cliente),
  esGaseosa(Bebida),
  costo(Bebida, Costo),
  recargo(Costo, 0, Precio).

calcularPrecio(Cliente, Bebida, Precio) :-
  esComerciante(Cliente),
  esAlcoholica(Bebida),
  costo(Bebida, Costo),
  recargo(Costo, 30, Precio).
