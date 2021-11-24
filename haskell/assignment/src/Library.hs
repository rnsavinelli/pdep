{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Library where
import PdePreludat
import Persona
import Fuente

-- Punto 1

esMuyFeliz = (> 100)
esModeradamenteFeliz = (> 50)

coeficienteDeSatisfaccion :: Persona -> Number
coeficienteDeSatisfaccion persona
  | esMuyFeliz _felicidonios = _felicidonios * _edad
  | esModeradamenteFeliz _felicidonios = _felicidonios * length _suenos
  | otherwise = div _felicidonios 2 -- Poco felíz
  where _felicidonios = felicidonios persona
        _edad = edad persona
        _suenos = suenos persona

calcularAmbicion :: Persona -> Number
calcularAmbicion (Persona edad suenos _ felicidonios _)
  | esMuyFeliz felicidonios = felicidonios * length suenos
  | esModeradamenteFeliz felicidonios = edad * length suenos
  | otherwise  = ((* 2) . length) suenos -- Poco felíz

-- Punto 2

tieneNombreLargo :: Persona -> Bool
tieneNombreLargo = (> 10) . length . nombre

esSuertuda :: Persona -> Bool
esSuertuda = even . coeficienteDeSatisfaccion

tieneNombreLindo :: Persona -> Bool
tieneNombreLindo = (== 'a') . last . nombre

-- Punto 3

queTodoSigaIgual :: Persona -> Persona
queTodoSigaIgual persona = persona

sumarFelicidonios :: Number -> Persona -> Persona
sumarFelicidonios cantidad persona =
  persona
  { felicidonios = felicidonios persona + cantidad
  }

agregarHabilidad :: String -> Persona -> Persona
agregarHabilidad carrera persona =
  persona
  { habilidades = habilidades persona  ++ [carrera]
  }

pasarAnio :: Persona -> Persona
pasarAnio persona =
  persona
  { edad = edad persona + 1
  }

recibirseDe :: String -> Persona -> Persona
recibirseDe carrera = sumarFelicidonios (((15 *) . length) carrera) . agregarHabilidad carrera

viajarA :: String -> Persona -> Persona
viajarA _ = pasarAnio . sumarFelicidonios 100

enamorarseDe :: Persona -> Persona -> Persona
enamorarseDe crush = sumarFelicidonios (felicidonios crush)

cumplirSuenos :: [Sueno] -> Persona -> Persona
cumplirSuenos [] persona = persona
cumplirSuenos [x] persona = cumplir x persona
cumplirSuenos (x : xs) persona = (cumplir x . cumplirSuenos xs) persona

cumplir :: Sueno -> Persona -> Persona
cumplir (Viajar destino) persona = viajarA destino persona
cumplir (Recibirse carrera) persona = recibirseDe carrera persona
cumplir (Enamorarse crush) persona = enamorarseDe crush persona
cumplir (Otro _) persona = queTodoSigaIgual persona

cumplirSuenoPorIndice :: Number -> Persona -> Persona
cumplirSuenoPorIndice n persona = cumplir (suenos persona !! n) persona

cumplirSuenosPersona :: Persona -> Persona
cumplirSuenosPersona persona = (cumplirSuenos . suenos) persona persona

comboPerfecto :: Persona -> Persona
comboPerfecto persona = sumarFelicidonios reward (cumplirSuenos suenos_combo persona)
  where suenos_combo = [Viajar "París", Viajar "Watcher's Hills", Recibirse "Medicina"]
        reward = 100

-- Punto 4.a

fuenteMinimalista :: Fuente
fuenteMinimalista persona =  persona_output {
    suenos = (tail . suenos) persona
  }
  where persona_output = cumplir ((head . suenos) persona) persona

-- Punto 4.b

eliminarSuenos persona = persona { suenos = [] }

fuenteCopada :: Fuente
fuenteCopada = eliminarSuenos . cumplirSuenosPersona

-- Punto 4.c

fuenteAPedido :: Number -> Fuente
fuenteAPedido = cumplirSuenoPorIndice

-- Punto 4.d

fuenteSorda :: Fuente
fuenteSorda = queTodoSigaIgual

-- Punto 5

fuenteGanadora :: [Fuente] -> Persona -> Criterio -> Fuente
fuenteGanadora fuentes persona criterio = foldl1 (aplicarCriterio criterio persona) fuentes

-- Ejemplo de uso:
-- fuentes = [fuenteSorda, fuenteAPedido 2, fuenteCopada]
-- voluntario = Persona 0 [Viajar "Tokio", Viajar "Amsterdam", Recibirse "Ingenieria"] "" 0 []
-- fuenteGanadora fuentes voluntario criterio1 

aplicarCriterio :: Criterio -> Persona -> Fuente -> Fuente -> Fuente
aplicarCriterio criterio persona fuente_a fuente_b 
  | criterio persona fuente_a fuente_b = fuente_a
  | otherwise = fuente_b

-- Punto 5.1
criterio1 :: Criterio
criterio1 persona fuente_a fuente_b = (felicidonios . fuente_a) persona >= (felicidonios . fuente_b) persona

-- Punto 5.2
criterio2 :: Criterio
criterio2 persona fuente_a fuente_b = (felicidonios . fuente_a) persona <= (felicidonios . fuente_b) persona

-- Punto 5.3
criterio3 :: Criterio
criterio3 persona fuente_a fuente_b = (length . habilidades . fuente_a) persona >= (length . habilidades . fuente_b) persona

-- Punto 6

obtenerSuenosPorFiltro ::  Filtro -> Persona -> Suenos
obtenerSuenosPorFiltro filtro persona = map snd (filter filtro (zip felicidonios_suenos (suenos persona)))
  where felicidonios_suenos = map (felicidonios . (($ persona) . cumplir)) (suenos persona)

-- Punto 6.1

filtroValioso :: Filtro
filtroValioso (felicidonios, _) = felicidonios > 100

tieneSuenoValioso :: Persona -> Suenos
tieneSuenoValioso = obtenerSuenosPorFiltro filtroValioso

-- Punto 6.2

filtroRaro :: Filtro
filtroRaro (felicidonios, _) = felicidonios == 0

tieneSuenoRaro :: Persona -> Suenos
tieneSuenoRaro = obtenerSuenosPorFiltro filtroRaro

-- Punto 6.3

felicidadTotal :: [Persona] -> Number
felicidadTotal personas = foldl1 (+) felicidonios_personas
  where felicidonios_personas = map (felicidonios . cumplirSuenosPersona) personas

-- Punto 7

personaSuenosInfinitos = Persona 0 (repeat (Otro "Tener sueños infinitos")) "" 0 []
