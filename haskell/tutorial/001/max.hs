maximo :: Float -> Float -> Float

-- maximo(x,y) { x, (x > y)
--               y, (x <= y)
-- }

maximo x y  | x > y = x
            | otherwise = y
