-- Definir la función esBisiesto/1, indica si un año es bisiesto.
-- Nota: Un año es bisiesto si es divisible por 400 o es divisible por 4 pero no es divisible por 100.
-- Nota: Resolverlo reutilizando la funciónesMultiploDe/2

esBisiesto :: Int -> Bool

-- esBisiesto x
--    | ((== 0).mod 400) x = True
--    | ((== 0).mod 100) x = False
--    | ((== 0).mod 4) x = True
--    | otherwise = True

esBisiesto x = ((== 0).mod 400) x || (((== 0).mod 100) x || (not.((== 0).mod 4)) x)
