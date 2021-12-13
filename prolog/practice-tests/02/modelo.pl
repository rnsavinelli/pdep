% juego(juego, plataforma soportada)

juego(minecraft, pc([windows,linux,mac])).

juego(minecraft, playstation(2)).

juego(minecraft, playstation(3)).

juego(superMario, xbox).

juego(superMario, xcube).

juego(saga(finalFantasy, 1), gameboy).

juego(saga(finalFantasy, 2), gameboy).

juego(saga(finalFantasy, 3), gameboy).

juego(saga(finalFantasy, 3), gameboyColor).

juego(saga(finalFantasy, 3), xbox).

juego(saga(sonic,1), genesis).

juego(saga(sonic,2), genesis).

juego(saga(sonic,3), genesis).

% usuarios(juego, plataforma, cantidad).

usuarios(minecraft,playstation(2), 40000).

usuarios(minecraft, playstation(3), 36700).

usuarios(saga(finalFantasy, 1), gameboy, 400).

usuarios(saga(finalFantasy, 2), gameboy, 220).

usuarios(superMario, xbox, 980).

usuarios(saga(finalFantasy, 3), gameboy, 70).

usuarios(saga(finalFantasy, 3), gameboyColor, 100).

usuarios(saga(sonic, 1), genesis, 500).

usuarios(saga(sonic, 2), genesis, 800).

usuarios(saga(sonic, 3), genesis, 1400).

%

portatil(psp).
portatil(gameboy).
portatil(gameboyColor).

vende(nintendo, gameboy).
vende(nintendo, xcube).
vende(nintendo, xbox).

vende(apple, pc([mac])).
vende(microsoft, pc([windows])).
vende(lenovo, pc([windows, linux])).

vende(sony, playstation(_)).

hackeable(pc(_)).
hackeable(psp).
hackeable(playstation(X)) :- X < 3.

%

incluido(A, B) :-
    forall(member(X, A), member(X, B)).

tienePlataformaQueSoporta(Empresa, Juego) :-
    vende(Empresa, pc(SistemasOperativosA)),
    juego(Juego, pc(SistemasOperativosB)),
    incluido(SistemasOperativosA, SistemasOperativosB).

tienePlataformaQueSoporta(Empresa, Juego) :-
    vende(Empresa, Consola),
    juego(Juego, Consola).

%

propietario(Empresa, Juego) :-
    juego(Juego, Plataforma),
    vende(Empresa, Plataforma),
    not(
        vende(OtraEmpresa, Plataforma),
        Empresa \= OtraEmpresa
    ).

prefierenPortatiles(Juego) :-
    juego(Juego, Plataforma),
    not(portail(Plataforma)),
    forall(
        usuarios(Juego, PlataformaPortatil, _),
        portatil(PlataformaPortatil)
    ).

nivelFanatismo(Juego, Nivel) :-
    findall(
        Cantidades,
        usuarios(Juego, _, Cantidades),
        ListaCantidades
    ),
    sumlist(ListaCantidades, Total),
    Nivel is Total / 1000.

esPirateable(Juego) :-
    findall(Cantidades, usuarios(Juego, _, Cantidades),ListaCantidades),
    sumlist(ListaCantidades, Total),
    Total > 5000,
    juego(Juego, Consola),
    hackeable(Consola).


ultimoDeLaSaga(Titulo, saga(Titulo, Edicion)) :-
    juego(saga(Titulo, Edicion), _),
    forall(juego(saga(Titulo, OtraEdicion), _), OtraEdicion =< Edicion).
