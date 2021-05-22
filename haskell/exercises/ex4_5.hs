-- Definir la función existsAny/2, que dadas una función booleana y una tupla 
-- de tres elementos devuelve True si existe algún elemento de la tupla que 
-- haga verdadera la función. 

tripleToList :: (a, a, a) -> [a]
tripleToList (x, y, z) = [x, y, z]

existsAny :: (a -> Bool) -> (a, a, a) -> Bool
existsAny f (x, y, z) = any f (tripleToList (x, y, z))