%Entonces, en la base de conocimiento listamos hechos que luego podemos consultar. Y algunos de esos hechos pueden tener el mismo nombre , como en:

gato(gardfield).
gato(nermal).

raton(floyd).

perro(oddie).

%Al conjunto de hechos que se llaman igual los solemos escribir juntos, y los conocemos como predicados. Así por ejemplo, en la base anterior los predicados son gato/1, raton/1 y perro/1:

%gato está conformado por dos hechos
%raton, por uno sólo
%perro, también, por uno sólo

%Veamos si queda claro: escribi una base de conocimiento predicados fuego, hierba y electrico que digan lo siguiente:

%pikachu y raichu son pokemones de tipo eléctrico.
%bulbasaur es de tipo hierba.
%charmander y charizard son de tipo fuego.

fuego(charmander).
fuego(charizard).
hierba(bulbasaur).
electrico(pikachu).
electrico(raichu).
