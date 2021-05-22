-- Definir la función mejor/3, que recibe dos funciones y un número, y devuelve
-- el resultado de la función que dé un valor más alto. P.ej. 

-- Main> mejor cuadrado triple 1 
-- 3 

-- Main> mejor cuadrado triple 5 
-- 25 

mejor f1 f2 number = max (f1 number) (f2 number)