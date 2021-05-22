{-
    Definir la función hayAlgunNegativo/2, que dada una lista de números devuelve True si hay algún nro. negativo. 
    Main> hayAlgunNegativo [2,-3,9]
    True 
-}

hayAlgunNegativo list = any (<0) list