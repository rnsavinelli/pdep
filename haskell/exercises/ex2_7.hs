-- Definir la función esBisiesto/1, indica si un año es bisiesto.
-- Nota: Un año es bisiesto si es divisible por 400 o es divisible por 4 pero no es divisible por 100.
-- Nota: Resolverlo reutilizando la funciónesMultiploDe/2

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = (== 0)(mod x y)

esBisiesto :: Int -> Bool
esBisiesto x = (esMultiploDe x 400) || (esMultiploDe x 4 && not (esMultiploDe x 100))
