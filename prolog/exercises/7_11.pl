%Escribí un programa Prolog que resuelva el siguiente problema lógico:

%Un asesino siempre odia a su víctima y nunca es más rico que ella. El asesino de la tía Agatha, además, vive en la mansión Dreadbury.
%Tía Agatha, el carnicero y Charles son las únicas personas que viven en la mansion.
%Charles odia a todas las personas de la mansión que no son odiadas por la tía Agatha.
%Agatha odia a todos los que viven en la mansión, excepto al carnicero.
%Quien no es odiado por el carnicero y vive en la mansión, es más rico que tía Agatha
%El carnicero odia a las mismas personas que odia tía Agatha.
%Al programa le tengo que poder preguntar quién es el asesino de la tía Agatha, y tiene que brindar una sola respuesta, de la siguiente forma:

%? asesino(agatha, Asesino).
%Asesino = ???

viveEnLaMansion(agatha).
viveEnLaMansion(carnicero).
viveEnLaMansion(charles).

odiaA(agatha, Persona) :-
  viveEnLaMansion(Persona),
  Persona \= carnicero.

odiaA(charles, Persona) :-
  viveEnLaMansion(Persona),
  not(odiaA(agatha, Persona)).

odiaA(carnicero, Persona) :-
  odiaA(agatha, Persona).

esMasRicoQue(agatha, Persona) :-
  viveEnLaMansion(Persona),
  not(odiaA(carnicero, Persona)).

asesino(agatha, Asesino) :-
  viveEnLaMansion(Asesino),
  odiaA(Asesino, agatha),
  not(esMasRicoQue(agatha, Asesino)).
