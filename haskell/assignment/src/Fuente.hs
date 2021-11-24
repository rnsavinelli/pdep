module Fuente where
import PdePreludat (String, Bool)
import Persona (Persona, Felicidonios, Sueno)

type Fuente = (Persona -> Persona)

type Criterio = (Persona -> Fuente -> Fuente -> Bool)

type Filtro = ((Felicidonios, Sueno) -> Bool)