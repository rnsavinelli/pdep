%Está bien, está bien, te vamos a contar una mejor forma de resolver el mismo problema: utilizando forall, el cuantificador universal (o dicho en criollo, "para todo").

%Escribí el predicado bienUbicado/1 del punto anterior utilizando forall. Asumí que ya escribimos quiereIr/2 por vos.

bienUbicado(Persona) :-
   viveEn(Persona, Zona),
   forall(quiereIr(Persona, Destino), quedaEn(Destino, Zona)).
