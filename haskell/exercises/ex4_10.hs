-- Armar una función promedios/1, que dada una lista de listas me devuelve la lista de los promedios de cada lista-elemento. P.ej. 
-- Main> promedios [[8,6],[7,9,4],[6,2,4],[9,6]] 
-- [7,6.67,4,7.5] 

mean list = sum list / fromInteger (toInteger(length list))

promedios :: [[Double]] -> [Double]
promedios = map mean