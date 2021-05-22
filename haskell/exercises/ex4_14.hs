{-
    Definir la función aprobaron/1, que dada la información de un curso devuelve la información de los alumnos que aprobaron. P.ej. 
    Main> aprobaron [[8,6,2,4],[7,9,6,7],[6,2,4,2],[9,6,7,10]] 
    [[7,9,6,7],[9,6,7,10]] 
    Ayuda: usar la función aprobó/1. 
-}

aprobo lista = all (>= 6) lista

aprobaron lista = filter aprobo lista