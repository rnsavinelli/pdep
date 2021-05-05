-- Siguiendo con el dominio del ejercicio anterior, tenemos ahora dos parciales con dos recuperatorios, lo representamos mediante un par de pares ((parc1,parc2),(recup1,recup2)).
-- Si una persona no rindió un recuperatorio, entonces ponemos un "-1" en el lugar correspondiente.
-- Observamos que con la codificación elegida, siempre la mejor nota es el máximo entre nota del parcial y nota del recuperatorio.
-- Considerar que vale recuperar para promocionar. En este ejercicio vale usar las funciones que se definieron para el anterior.
--
-- Definir la función notasFinales que recibe un par de pares y devuelve el par que corresponde a las notas finales del alumno para el 1er y el 2do parcial. P.ej.
--
-- Escribir la consulta que indica si un alumno cuyas notas son ((2,7),(6,-1)) recursa o no. O sea, la respuesta debe ser True si recursa, y False si no recursa. Usar las funciones definidas en este punto y el anterior, y composición. La consulta debe tener esta forma:
--
-- Escribir la consulta que indica si un alumno cuyas notas son ((2,7),(6,-1)) recuperó el primer parcial. Usar composición. La consulta debe tener esta forma:
--
-- Definir la función recuperoDeGusto que dado el par de pares que representa a un alumno, devuelve True si el alumno, pudiendo promocionar con los parciales (o sea sin recup.), igual rindió al menos un recup. Vale definir funciones auxiliares. Hacer una definición que no use pattern matching, en las eventuales funciones auxiliares tampoco; o sea, manejarse siempre con fst y snd.

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

--type NotasAnual ((parc1, parc2), (rec1, rec2))
type NotasAnual = (Notas, Notas)

notasFinales :: NotasAnual -> Notas
notasFinales notas = (max ((fst.fst) notas) ((fst.snd) notas), max ((snd.fst) notas) ((snd.snd) notas))

recursa :: NotasAnual -> Bool
recursa = not.aprobo.notasFinales

recuperoPrimerParcial :: NotasAnual -> Bool
recuperoPrimerParcial = not.(== -1).fst.snd

recuperoDeGusto :: NotasAnual -> Bool
recuperoDeGusto notas = (aproboPrimerParcial.fst) notas && (recuperoPrimerParcial) notas
