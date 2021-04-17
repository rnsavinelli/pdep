-- Definiciones equivalentes

-- esPar = even

-- esPar = not.odd

-- esPar x = x `mod` 2 == 0

esPar x = ((== 0).(`mod` 2)) x

