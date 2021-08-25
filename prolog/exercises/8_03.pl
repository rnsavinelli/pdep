%En general vamos a querer incoporar la noción de tipo a nuestras tuplas.

%Prolog nos da algo para modelar esto: functores, que son similares a una tupla, pero además tienen un nombre.

%Por ejemplo, incorporemos la casa (la famila) a la que pertenece cada personaje. En nuestro ejemplo Jon y Sansa son de la familia Stark.

personaje(jonSnow, stark(18, hombre)).
personaje(sansa, stark(15, mujer)).

%Lo que hicimos fue simplemente agregar un nombre a la tupla. ¿simple no? Y lo podemos consultar de la siguiente forma:

%? personaje(jonSnow, Personaje).
%Personaje = stark(18, hombre).

%Ah, cuidado con la sintaxis: no puede haber espacios entre el nombre del functor y el paréntesis de apertura. stark (18, hombre) NO anda.

%Veamos si se entiende: agregá las siguientes cláusulas a la base de conocimiento de arriba:

%arya es una stark, mujer de 14
%cersei es una lannister, mujer de 34

personaje(arya, stark(14, mujer)).
personaje(cersei, lannister(34, mujer)).
