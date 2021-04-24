descartar _ [] = []
descartar 0 xs = xs
descartar n (_:xs) = descartar (n-1) xs
