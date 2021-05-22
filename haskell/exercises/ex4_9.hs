-- Definir la función esMultiploDeAlguno/2, que recibe un número y una lista y devuelve True si el número es múltiplo de alguno de los números de la lista. P.ej. 
-- Main> esMultiploDeAlguno 15 [2,3,4] 
-- True

-- Main> esMultiploDeAlguno 34 [3,4,5] 
-- False 

sonMultiplos :: Int -> Int -> Bool
sonMultiplos x y = x `mod` y == 0

esMultiploDeAlguno :: Int -> [Int] -> Bool
esMultiploDeAlguno number = any (sonMultiplos number)