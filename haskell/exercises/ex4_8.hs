-- Definir la función parDeFns/3, que recibe dos funciones y un valor, y 
-- devuelve un par ordenado que es el resultado de aplicar las dos funciones
-- al valor. P.ej. 
-- Main> parDeFns even doble 12 
-- (True, 24) 

parDeFns f1 f2 valor = (f1 valor, f2 valor)