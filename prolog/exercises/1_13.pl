#En el barrio de Flores hay muchas formas de llamar a las personas y otros seres

#A todos se los puede llamar por su nombre
#A los tahúres, se los puede llamar además por su apodo (todos los tahúres tienen un apodo)
#Y al diablo le dicen belcebú o asmodeo
#Ejemplo:

#? leDicen(bernardo, ruso).
#yes. % (por el punto 2.)
#? leDicen(jorge, jorge).
#yes. % (por el punto 1.)
#? leDicen(elDiablo, belcebu).
#yes. % (por el punto 3.)
#? leDicen(elDiablo, elDiablo).
#yes. % (por el punto 1.)

leDicen(Nombre, Nombre).

leDicen(Nombre, Apodo) :-
  tahur(Nombre, Apodo).

leDicen(elDiablo, belcebu).
leDicen(elDiablo, asmodeo).
