-- Redefining a function
is_even = even

-- Defining a function
quadruple :: Float -> Float
quadruple number = 4 * number

-- Mathematical Equality
stickLength = 300
sticksForFrame = 4

stickLengthForFrame = quadruple

howManySticks :: Int -> Int
howManySticks len = div len stickLength

isLongEnought :: Int -> Bool
isLongEnought len = len >= stickLength

canBuildFrame :: Int -> Bool
canBuildFrame len = (howManySticks len) >= sticksForFrame

howManyFrames :: Int -> Int
howManyFrames len = div (howManySticks len) sticksForFrame
