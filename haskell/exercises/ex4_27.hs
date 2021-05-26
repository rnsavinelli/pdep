{-
Definir una función que resuelva la productoria de una lista de números. 
Nota: Resolverlo utilizando foldl/foldr. 
-}

productoria list = foldl (*) 1 list