-- Definir la función esMultiploDe/2, que devuelve True si el segundo es múltiplo del primero.

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = (== 0)(mod x y)
