{-
    Definir la función divisores/1, que recibe un número y devuelve la lista de divisores. P.ej. 
    Main> divisores 60 
    [1,2,3,4,5,6,10,12,15,20,30,60] 
-}

sonMultiplos x y = x `mod` y == 0

divisores numero = filter (sonMultiplos numero) [1..numero]