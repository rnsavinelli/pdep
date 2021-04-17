-- Definir la función esMultiploDe/2, que devuelve True si el segundo es múltiplo del primero.

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = (mod x y) == 0
