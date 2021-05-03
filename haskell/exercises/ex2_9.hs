-- Definir una función incrementMCuadradoN, que invocándola con 2 números m y n, incrementa un valor m al cuadrado de n.

siguiente :: (Int a) => a -> a
siguiente = (+ 1)

incrementarMCuadradoN :: (Integral x, Int y) => x -> y -> y
incrementarMCuadradoN x y = siguiente.(x ^ y)

