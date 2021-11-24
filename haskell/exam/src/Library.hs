module Library where
import Data.List (find)
import PdePreludat
import Definitions

pago :: Saldo -> Transaccion
pago coins = cobro (-coins)

cobro :: Saldo -> Transaccion
cobro coins cuenta = cuenta {saldo = ((+ coins) . saldo) cuenta}

mineria :: Transaccion
mineria = cobro 25

isCuenta :: Identificador -> Cuenta -> Bool
isCuenta idCuenta = (== idCuenta) . identificador

getCuentaByCondicion :: (Cuenta -> Bool) -> [Cuenta] -> Cuenta
getCuentaByCondicion condicion cuentas = head (dropWhile (not . condicion) cuentas)

removeCuentaByCondicion ::(Cuenta -> Bool) ->  [Cuenta] -> [Cuenta]
removeCuentaByCondicion condicion cuentas = removeCuenta (getCuentaByCondicion condicion cuentas) cuentas

removeCuenta :: Cuenta -> [Cuenta] -> [Cuenta]
removeCuenta cuenta = filter (/= cuenta)

ejercicio3 :: Identificador -> [Cuenta] -> Transaccion -> [Cuenta]
ejercicio3 idCuenta cuentas funcion =  funcion cuentaFound : listaFiltrada
    where cuentaFound = getCuentaByCondicion (isCuenta idCuenta) cuentas
          listaFiltrada = removeCuentaByCondicion (isCuenta idCuenta) cuentas

ejercicio5 :: [Cuenta] -> Bool
ejercicio5 = all ((>= 0) . saldo)

ejercicio4 :: Bloque -> [Cuenta] -> [Cuenta]
ejercicio4 bloque cuentas
  | ejercicio5 cuentas = map (aplicarBloque bloque) cuentas
  | otherwise = cuentas

aplicarBloque :: Bloque -> Cuenta -> Cuenta
aplicarBloque bloques cta = foldr id cta transacciones
    where transacciones = map snd bloques


-- Punto 6 no testeado por falta de tiempo
aplicarBloques :: BlockChain -> Cuenta -> Cuenta
aplicarBloques [] cuenta = cuenta
aplicarBloques [x] cuenta = aplicarBloque x cuenta
aplicarBloques (x : xs) cuenta = (aplicarBloque x . aplicarBloques xs) cuenta

ejercicio6 :: BlockChain -> [Cuenta] -> Bool
ejercicio6 block_chain cuentas = ejercicio5 cuentas_transaccionadas
    where cuentas_transaccionadas = map (aplicarBloques block_chain) cuentas

funcionSinPudor x y 
    | (length . filter even . map (fst y) $ head x) > 10 = id 
    | otherwise = snd y -- Y es una tupla

-- x es una lista puesto que se pide en primer elemento en: head x
-- luego se mapea una nueva lista aplicando el primer elemento de y a x... (x es una lista de listas)
-- se extraen los que sean even y a este resultado se le calcula el largo
-- si es mayor que 10 se devuelve el último elemento que se le pasa a la función...
-- Esto es, la funcion devuelve o el último elemento sin modificar, o el último elemento aplicándole 
-- la función que está almacenada en el segundo elemento de la tupla y.