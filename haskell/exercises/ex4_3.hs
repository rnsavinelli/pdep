-- Definir la función esCapicua/1, si dada una lista de listas, me devuelve si
-- la concatenación de las sublistas es una lista capicua.
-- Ej:
-- Main> esCapicua ["ne", "uqu", "en"]
-- True

esCapicua list = (concat list) == (reverse . concat) list
