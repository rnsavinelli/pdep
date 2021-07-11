%Toda persona es mortal
%Sócrates es una persona
%Por tanto, Sócrates es mortal

%Aplicando este razonamiento, escribí un predicado mortal/1 que nos diga si un inidividuo... es mortal

%Tené en cuenta que Aristóteles, Hipatia, Platon y Sócrates son personas.

mortal(X) :-
  persona(X).

persona(socrates).
persona(hipatia).
persona(platon).
persona(aristoteles).
