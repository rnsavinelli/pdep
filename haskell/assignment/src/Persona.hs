module Persona where
import PdePreludat ( Eq, Show(show), Number, String )

type Edad = Number
type Nombre = String
type Felicidonios = Number
type Habilidades = [String]

data Sueno = Recibirse String | Viajar String | Enamorarse Persona | Otro String
   deriving (Eq) 
type Suenos = [Sueno]

instance Show Sueno where
   show (Recibirse carrera) = show carrera
   show (Viajar destino) = show destino
   show (Enamorarse persona) = show persona
   show (Otro misc) = show misc

data Persona = Persona {
   edad :: Edad,
   suenos :: Suenos,
   nombre :: Nombre,
   felicidonios :: Felicidonios,
   habilidades :: Habilidades
} deriving (Show, Eq)