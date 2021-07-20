%En una casa de bebidas, queremos saber si una bebida es alcoholica o no. Se sabe que:

%El agua y las gaseosas no tienen alcohol.
%Los vinos y whiskies tienen alcohol
%Desarrollá el predicado esAlcoholica/1:

%? esAlcoholica(criadores).
%yes

%? esAlcoholica(villavicencio).
%no

%Asumir que se cuenta con predicados esWhisky/1 y esVino/1, que nos dicen si una bebida es whisky o vino, respectivamente.

esAlcoholica(Bebida) :-
  esWhisky(Bebida).

esAlcoholica(Bebida) :-
  esVino(Bebida).
