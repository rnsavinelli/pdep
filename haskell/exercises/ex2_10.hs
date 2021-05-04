-- Definir una función esResultadoPar/2, que invocándola con número n y otro m, devuelve true si el resultado de elevar n a m es par.

pow x = (^) x

esResultadoPar x = even.pow x
