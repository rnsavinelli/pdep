%Tenemos una base de conocimientos como la siguiente:

destino(pepe, alejandria).
destino(pepe, jartum).
destino(pepe, roma).
destino(juancho, roma).
destino(juancho, belgrado).
destino(lucy, roma).
destino(lucy, belgrado).

idioma(alejandria,arabe).
idioma(jartum, arabe).
idioma(belgrado, serbio).
idioma(roma, italiano).

habla(pepe, bulgaro).
habla(pepe, italiano).
habla(juancho, arabe).
habla(juancho, italiano).
habla(juancho, espaniol).
habla(lucy, griego).

%Desarrollar el predicado granCompanieroDeViaje/2 que relaciona a dos personas que tienen al menos un destino en común, si el segundo habla los idiomas de todos los destinos del primero para los cuales el primero no habla el idioma.

tienenDestinoEnComun(Persona1, Persona2) :-
  destino(Persona1, Destino),
  destino(Persona2, Destino).

granCompanieroDeViaje(Persona1, Persona2) :-
  tienenDestinoEnComun(Persona1, Persona2),
  forall(
    destino(Persona1, Destino),
    (
      idioma(Destino, Idioma),
      (
        (not(habla(Persona1, Idioma)), habla(Persona2, Idioma));
        habla(Persona1, Idioma)
      )
    )
  ).
