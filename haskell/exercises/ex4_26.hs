{-
Definir una función que sume una lista de números. 
Nota: Resolverlo utilizando foldl/foldr.
-}

-- sumar list = foldl (+) 0 list

sumar list = foldr (+) 0 list