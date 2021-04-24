-- Trabajamos con tres números que imaginamos como el nivel del río Paraná a la
-- altura de Corrientes medido en tres días consecutivos; cada medición es un entero que
-- representa una cantidad de cm.

-- 1.10. a. dispersion, que toma los tres valores y devuelve la diferencia entre el más alto y
-- el más bajo. Ayuda: extender max y min a tres argumentos, usando las versiones de dos
-- elementos. De esa forma se puede definir dispersión sin escribir ninguna guarda (las
-- guardas están en max y min, que estamos usando).

maximo a b c = (max a (max b c))
minimo a b c = (min a (min b c))

dispersion a b c = maximo a b c - minimo a b c

-- 1.10. b. diasParejos, diasLocos y diasNormales reciben los valores de los tres días. Se
-- dice que son días parejos si la dispersión es chica, que son días locos si la dispersión es
-- grande, y que son días normales si no son ni parejos ni locos. Una dispersión se considera
-- chica si es de menos de 30 cm, y grande si es de más de un metro.
--
-- Nota: Definir diasNormales a partir de las otras dos, no volver a hacer las cuentas.

diasParejos a b c = (dispersion a b c) < 30

diasLocos a b c = (dispersion a b c) > 100

diasNormales a b c = not (diasParejos a b c) && not (diasLocos a b c)
