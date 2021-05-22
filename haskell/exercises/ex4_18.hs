{-
    Definir la función aplicarFunciones/2, que dadas una lista de funciones y un valor cualquiera, devuelve la lista del resultado de aplicar las funciones al valor. P.ej. 
    Main> aplicarFunciones[(*4),(+3),abs] (-8) 
    [-32,-5,8] 
    Si pongo:
    Main> aplicarFunciones[(*4),even,abs] 8 
    da error. ¿Por qué? 
-}

-- Devuelven diferentes tipos de datos.

-- aplicarFunciones :: [t -> a] -> t -> [a]
-- aplicarFunciones [] _ = []
-- aplicarFunciones (fx:fxs) value = fx value : aplicarFunciones fxs value

aplicarFunciones :: [t -> a] -> t -> [a]
aplicarFunciones flist value = map ($ value) flist