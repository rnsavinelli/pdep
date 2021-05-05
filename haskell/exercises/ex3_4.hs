-- Representamos las notas que se sacó un alumno en dos parciales mediante un par (nota1,nota2).
-- a) Definir la función esNotaBochazo, recibe un número y devuelve True si no llega a 6, False en caso contrario. No vale usar guardas.
-- b) Definir la función aprobo, recibe un par e indica si una persona que se sacó esas notas aprueba. Usar esNotaBochazo.
-- c)Definir la función promociono, que indica si promocionó, para eso tiene las dos notas tienen que sumar al menos 15 y además haberse sacado al menos 7 en cada parcial.
-- d) Escribir una consulta que dado un par indica si aprobó el primer parcial, usando esNotaBochazo y composición.

type Notas = (Int, Int)

esNotaBochazo nota = nota < 6

esNotaMayorA7 nota = nota >= 7

sumaNotas :: Notas -> Int
sumaNotas notas = (fst notas) + (snd notas)

aprobo :: Notas -> Bool
aprobo notas = (not.esNotaBochazo.fst) notas && (not.esNotaBochazo.snd) notas

promociono :: Notas -> Bool
promociono notas = ((esNotaMayorA7.fst) notas) && ((esNotaMayorA7.snd) notas) && (sumaNotas notas >= 15)

aproboPrimerParcial :: Notas -> Bool
aproboPrimerParcial = (not.esNotaBochazo.fst)
