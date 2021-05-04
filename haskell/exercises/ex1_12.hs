-- 1.12. Desafío Café con Leche:
--
-- Implementar la función esCuadradoPerfecto/1, sin hacer operaciones con punto flotante.
-- Ayuda: les va a venir bien una función auxiliar, tal vez de dos parámetros. Pensar que el
-- primer cuadrado perfecto es 0, para llegar al 2do (1) sumo 1, para llegar al 3ro (4) sumo
-- 3, para llegar al siguiente (9) sumo 5, después sumo 7, 9, 11 etc.
--
-- También algo de recursividad van a tener que usar.

cuadradoPerfectoSum i n
    | i < n = cuadradoPerfectoSum i n
    | otherwise = cuadradoPerfectoSum ((2 * i) - 1) (i + 1)

esCuadradoPerfecto nro = cuadradoPerfectoSum 1 nro

