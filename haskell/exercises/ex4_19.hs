{-
    Definir la función sumaF/2, que dadas una lista de funciones y un número, devuelve la suma del resultado de aplicar las funciones al número. P.ej.
    Main> sumaF[(*4),(+3),abs] (-8) 
    -29 
-}

aplicarFunciones :: [t -> a] -> t -> [a]
aplicarFunciones flist value = map ($ value) flist

sumaF flist value = sum (aplicarFunciones flist value)