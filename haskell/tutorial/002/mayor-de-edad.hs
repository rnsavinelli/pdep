type Nombre = String
type Edad = Integer

type Persona = (Nombre, Edad)

edad :: Persona -> Edad
edad (_, e) = e

nombre :: Persona -> Nombre
nombre (n, _) = n

esMayorDeEdad :: Persona -> Bool
esMayorDeEdad = (>= 18) . edad

esMenorDeEdad :: Persona -> Bool
esMenorDeEdad = not . esMayorDeEdad

