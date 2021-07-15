%Escribí un programa Prolog que responda consultas acerca de qué colores atraen a una determinada persona, de acuerdo con la siguiente información:

%A Mabel y a Ana les atrae el rosa.
%A Mara le atraen el celeste y el lila.
%A Juan le atraen todos los colores pastel.
%A todas las mujeres y a Pablo les atrae el azul.
%A los varones mayores y a Mabel les atrae el rojo.
%A todos los porteños (sin importar el sexo) y a Adrián les atrae el amarillo.
%A Ana y a Juan les atrae el naranja.
%Mabel, Mara y Pablo son porteños.
%Ana y Pablo son mayores.
%El rosa, el celeste y el lila son colores pastel.

%Codificá el predicado atraeA/2: que relaciona una persona y un color, cuando a la persona le atrea este color.

%Ejemplos de consulta:

%? atraeA(mabel, rosa).
%yes

% mujer()
mujer(mabel).
mujer(mara).
mujer(ana).

% varon()
varon(juan).
varon(pablo).
varon(adrian).

% pastel()
pastel(rosa).
pastel(celeste).
pastel(lila).

% porteño()
porteño(mabel).
porteño(mara).
porteño(pablo).

% mayor()
mayor(ana).
mayor(pablo).

% atraeA()
atraeA(mabel, rosa).
atraeA(ana, rosa).

atraeA(mara, celeste).
atraeA(mara, lila).

atraeA(juan, Color) :-
  pastel(Color).

atraeA(Persona, azul) :-
  mujer(Persona) ; Persona == pablo.

atraeA(Persona, rojo) :-
  (varon(Persona) , mayor(Persona)) ;
  Persona == mabel.

atraeA(Persona, amarillo) :-
  porteño(Persona) ;
  Persona == adrian.

atraeA(juan, naranja).
atraeA(ana, naranja).
