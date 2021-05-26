{-
Definir la función dispersion, que recibe una lista de números y devuelve la dispersión de los valores, o sea máximo - mínimo. 
Nota: Probar de utilizar foldr. 
-}

dispersion lista =  foldl1 max lista - foldl1 min lista