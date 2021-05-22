-- Armar una función promediosSinAplazos que dada una lista de listas me devuelve la lista de los promedios de cada lista-elemento, excluyendo los que sean menores a 4 que no se cuentan. P.ej. 
-- Main> promediosSinAplazos [[8,6],[6,2,6]] 
-- [7,6] 
-- Nota: Implementar una solución utilizando map/2. 

mean list = sum list / fromInteger (toInteger(length list))

promediosSinAplazos :: [[Double]] -> [Double]
promediosSinAplazos lista =  map mean listaSinAplazos
    where listaSinAplazos = map (filter (>=4)) lista