-- Durante un entrenamiento físico de una hora, cada 10 minutos de
-- entrenamiento se tomó la frecuencia cardíaca de uno de los participantes
-- obteniéndose un total de 7 muestras que son las siguientes:

frecuenciaCardiaca = [80, 100, 120, 128, 130, 123, 125]

-- Comienza con un frecuencia de 80 min 0.
-- A los 10 min la frecuencia alcanza los 100
-- A los 20 min la frecuencia es de 120,
-- A los 30 min la frecuencia es de 128
-- A los 40 min la frecuencia es de 130, …etc..

-- A los 60 min la frecuencia es de 125 frecuenciaCardiaca es un función
-- constante.

-- a) Definir la función promedioFrecuenciaCardiaca, que devuelve el promedio
-- de la frecuencia cardíaca.

mean list = (sum list) / fromInteger (toInteger(length list))

promedioFrecuenciaCardiaca = mean $ frecuenciaCardiaca

-- b) Definir la función frecuenciaCardiacaMinuto/1, que recibe m que es el i
-- minuto en el cual quiero conocer la frecuencia cardíaca, m puede ser a los
-- 10, 20, 30 ,40,..hasta 60.

frecuenciaCardiacaMinuto m = frecuenciaCardiaca !! index
    where index = div m 10

-- c) Definir la función frecuenciasHastaMomento/1, devuelve el total de
-- frecuencias que se obtuvieron hasta el minuto m.

frecuenciasHastaMomento m = take (index + 1) frecuenciaCardiaca
    where index = div m 10
