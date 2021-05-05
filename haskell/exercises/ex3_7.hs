-- Definir la función calcular, que recibe una tupla de 2 elementos, si el primer elemento es par lo duplica, sino lo deja como está y con el segundo elemento en caso de ser impar le suma 1 y si no deja esté último como esta.

duplicar = (2 *)

siguiente = (1 +)

operacionA x
    | even x = duplicar x
    | otherwise = x

operacionB y
    | odd y = siguiente y
    | otherwise = y

calcular (x, y) = (operacionA x, operacionB y)
