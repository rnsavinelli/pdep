-- Resolver la función inversaRaizCuadrada/1, que da un número n devolver la inversa su raíz cuadrada.

inversa :: Float -> Float
inversa = (1 /)

inversaRaizCuadrada :: Float -> Float
inversaRaizCuadrada = sqrt.inversa
