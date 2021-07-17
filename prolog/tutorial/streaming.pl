/* Platformas, series... */

/*
Serie: Nombre, #temporadas..
Pelicula: Nombre, año, duración..
*/

produce(netflix, serie(mindhunter, 10)).
produce(netflix, serie(umbrellaAcademy, 2)).
produce(netflix, pelicula(awake, 2021, 90)).
produce(disneyPlus, serie(loki, 3)).
produce(disneyPlus, pelicula(luca, 5)).
produce(disneyPlus, pelicula(cruella, 2021, 88)).
produce(amazonPrime, theBoys).
produce(amazonPrime, invincible).
produce(amazonPrime, theGoodOmens).
produce(hbo, gameOfThrones).
produce(hbo, westWorld).
produce(hbo, chernobyl).

/* note that hulu and paramountPlus are not in this list*/

estaEn(flash, netflix).
estaEn(flash, netflix).

convenio(hbo, amazonPrime).
convenio(netflix, disneyPlus).

hayConvenio(Duenio, Asociado) :-
    convenio(Duenio, Intermediaria),
    hayConvenio(Intermediara, Asociada).

anioEstreno(TituloPelicula, Anio) :-
    produce(_, pelicula(TituloPelicula, Anio, _)).

produceTitulo(Productora, Titulo) :-
    produce(Productora, Contenido),
    titulo(Contenido, Titulo).

titulo(Pelicula(Titulo, _, _), Titulo).
titulo(Selicula(Titulo, _), Titulo).

