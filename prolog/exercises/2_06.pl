%En un grupo de amigos, sabemos que:

%Luis gusta de Nora
%Roque gusta de Ana
%Roque gusta de Nora
%Marcos gusta de Zulema
%Todos los chicos que gustan de Ana, también gustan de Zulema
%A Juan le gustan todas las chicas que le gustan a Roque
%A Juan le gusta Nuria
%A Ana no le gusta nadie
%A Zulema le gusta Ana

%Desarrollá un predicado gustaDe/2, que nos diga si una persona gusta de la otra.

% Chicas
chica(nora).
chica(ana).
chica(zulema).
chica(nuria).

% Chicos
chico(luis).
chico(roque).
chico(marcos).
chico(juan).

% gustaDe
gustaDe(luis, nora).
gustaDe(roque, ana).
gustaDe(roque, nora).
gustaDe(marcos, zulema).
gustaDe(juan, nuria).
gustaDe(zulema, ana).

gustaDe(juan, Y) :-
  gustaDe(roque, Y), chica(Y).

gustaDe(X, zulema) :-
  gustaDe(X, ana), chico(X).
