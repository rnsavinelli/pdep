-- Se tiene información detallada de la duración en minutos de las llamadas
-- que se llevaron a cabo en un período determinado, discriminadas en horario
-- normal y horario reducido.

duracionLlamadas = (("horarioReducido", [20, 10, 25, 15]) ,("horarioNormal", [10, 5, 8, 2, 9, 10]))

-- Definir la función cuandoHabloMasMinutos, devuelve en que horario se habló
-- más cantidad de minutos, en el de tarifa normal o en el reducido. 
-- Main> cuandoHabloMasMinutos 
-- “horarioReducido” 

cuandoHabloMasMinutos
    | sumHorarioReducido > sumHorarioNormal = fst . fst $ duracionLlamadas
    | otherwise = fst . snd $ duracionLlamadas
    where sumHorarioReducido = sum . snd . fst $ duracionLlamadas
          sumHorarioNormal = sum . snd . snd $ duracionLlamadas

-- Definir la función cuandoHizoMasLlamadas, devuelve en que franja horaria 
-- realizó más cantidad de llamadas, en el de tarifa normal o en el reducido. 
-- Main> cuandoHizoMasLlamadas 
-- “horarioNormal” 

cuandoHizoMasLlamadas
    | llamadasHorarioReducido > llamadasHorarioNormal = fst . fst $ duracionLlamadas
    | otherwise = fst . snd $ duracionLlamadas
    where llamadasHorarioReducido = length . snd . fst $ duracionLlamadas
          llamadasHorarioNormal = length . snd . snd $ duracionLlamadas
