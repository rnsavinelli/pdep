-- Definir la función mcm/2 que devuelva el mínimo común múltiplo entre dos números, de acuerdo a esta fórmula.
-- m.c.m.(a, b) = {a * b} / {m.c.d.(a, b)}
--

mcm a b = (a * b) `div` (gcd a b)
