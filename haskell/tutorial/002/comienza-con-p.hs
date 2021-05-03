esP :: Char -> Bool
esP x = ('p' == x) || ('P' == x)

comienzaConP = esP . head
