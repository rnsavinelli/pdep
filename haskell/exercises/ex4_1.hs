-- Definir una función que sume una lista de números.
-- Nota: Investigar sum

sumarLista :: Num a => [a] -> a
-- sumarLista = sum
sumarLista = foldl (+) 0
