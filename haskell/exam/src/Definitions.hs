module Definitions where
import PdePreludat

type Estado = String
type Identificador = String

type Saldo = Number
type Transaccion = Cuenta -> Cuenta

type BlockChain = [Bloque]
type Bloque = [(Identificador, Transaccion)]

data Cuenta  = Cuenta {
    identificador :: Identificador,
    saldo :: Saldo
} deriving (Show, Eq)

data CurryCoin = Currycoin {
    bloque :: Bloque,
    estados :: [Estado]
} deriving (Show, Eq)