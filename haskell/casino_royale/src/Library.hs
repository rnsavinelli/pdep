module Library where
import PdePreludat

type Carta = (Number, String)

palos = ["Corazones", "Picas", "Tréboles", "Diamantes"]

type Nombre = String
type Mano = [Carta]
type Bebida = String

data Jugador = Jugador {
    nombre :: Nombre,
    mano :: Mano,
    bebida :: Bebida
} deriving Show

-- ocurrenciasDe :: Number -> [] -> Number
ocurrenciasDe x = length . filter (== x)

-- concatenar :: [] -> []
concatenar = foldl (++) []

-- 1.a
mayorSegun funcion x y
    | funcion x > funcion y = x
    | otherwise = y

-- 1.b
maximoSegun _ [x] = x
maximoSegun f (x:y:xs) = maximoSegun f (mayorSegun f x y:xs)

-- 1.c
sinRepetidos [] = []
sinRepetidos (x:xs) = x : (sinRepetidos.filter (/= x)) xs

-- 2.a
-- numeroFueraDeRango carta = (not . elem (fst carta)))[1..13]
numeroFueraDeRango carta = not . elem (fst carta) $ [1..13]

paloInvalido carta = not . elem (snd carta) $ palos

esoNoSeVale carta = numeroFueraDeRango carta || paloInvalido carta

-- 2.a
manoNegra jugador = length cartas /= 5 || any esoNoSeVale cartas
    where cartas = mano jugador

-- 3.a
seRepite cantidad lista elemento = ocurrenciasDe elemento lista == cantidad

parCartas cartas = any (seRepite 2 numeros) numeros
    where numeros = map fst cartas

-- 3.b
piernaCartas cartas = any (seRepite 3 numeros) numeros
    where numeros = map fst cartas

-- 3.c
-- colorCartas cartas = length (sinRepetidos colores) == 1
--    where colores = map snd cartas
colorCartas cartas = all (== head colores) colores
    where colores = map snd cartas

-- 3.d
fullHouseCartas cartas = parCartas cartas && piernaCartas cartas

-- 3.e
pokerCartas cartas = any (seRepite 4 numeros) numeros
    where numeros = map fst cartas

-- 3.f
otroCartas :: Mano -> Bool
otroCartas _ = True