--  Definir la función esMultiploDeTres/1,  que devuelve True si un número es múltiplo de 3.

esMultiploDeTres :: Int -> Bool
esMultiploDeTres x = (mod x 3) == 0
