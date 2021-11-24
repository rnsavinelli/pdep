## Punto 1

### Para pensar:

#### ¿Qué representa la cursiva muy feliz, poco feliz, moderadamente feliz?

Las cursivas "muy feliz", "poco feliz", "moderadamente feliz", se utilizan para representar si una persona tiene un coeficiente de satisfacción y un grado de ambición elevados, bajos, o moderados, respectivamente. Esto nos indica, mediante sus valores numericos, donde deberiamos hacer los tests minimos para probar todos los casos.

#### ¿Tiene algún criterio elegir 50, 100 y 101 felicidonios dentro de las pruebas? Justificar.

Si, el comportamiento de las funciones varía según si los felicidonios de la persona son: (1) mayores a 100; (2) menores o iguales a 100, y mayores que 50; (3) menores o iguales que 50.

Por lo que no es ni indistinta ni azarosa la selección de las cantidades para hacer las pruebas.

Más formalmente veamos, por ejemplo, la definición de coeficieteDeSatisfacción, donde se aprecia cómo el comportamiento se ve modificado por la cantidad de felicidonios que la persona tenga:

```
coeficienteDeSatisfaccion :: Persona -> Number
coeficienteDeSatisfaccion persona
  | felicidonios persona > 100 = felicidonios persona * edad persona
  | felicidonios persona > 50 = felicidonios persona * (length . suenos) persona
  | otherwise = div (felicidonios persona) 2
```

## Punto 2

### Para pensar:

#### ¿Qué nombre representa mejor la clase de equivalencia del test: evangelina o personaNombreNormal? Justificar

personaNombreNormal es el nombre que mejor representa la clase de equivalencia para los nombre de largo menor, o igual, que 10.

Evangelina no es apropiado ya que no otorga información sobre lo que la clase de equivalencia comprende.

#### ¿Qué nombre le asignás a la variable para el test de la persona suertuda? ¿Y a la no-suertuda? Justificar.

Cualquier nombre que satisfaga no ser una palabra reservada y admitido por Haskell, a la  vez que identifique claramente el uso de esa variable en el test correspondiente. Una opcion para estos casos es asignar personaConSuerte o personaSuertuda y personaSinSuerte o personaNoSuertuda respectivamente, de esta manera al leer el codigo de los tests queda claro cual variable se utiliza para cual test y cual deberia ser su resultado sin necesidad de leer el codigo completo del test.

### Señalar:

Según nuestra definición de tieneNombreLindo:

```
tieneNombreLindo :: Persona -> Bool
tieneNombreLindo = (== 'a') . last . nombre
```

#### Para la definición de tieneNombreLindo, dónde aparece la aplicación parcial.

La aplicación parcial aparece en la utilización de (== 'a') y en la omision del parametro de manera explicita.

#### Para la definición de tieneNombreLindo , dónde aparece la composición.

La composición aparece en el uso del operador "." para concatenar las operaciones (== 'a'), last, y nombre a la persona que se toma como parámetro.

#### ¿Qué ventajas trajo utilizar dichos conceptos?. Justificar.

Dentro de las ventajas que trae utilizar dichos conceptos se encuentran:

- Podemos generar nuevas funciones fijando algún/algunos parámetro/s de una función ya definida.
- Podemos reutilizar funciones en diferentes contextos.
- Podemos construir funciones nuevas a partir de la aplicación sucesiva de funciones existentes

## Punto 4

### ¿Cómo modelaron cada una de las fuentes? ¿Por qué?

Modelamos las fuentes según:

```hs
type Fuente = (Persona -> Persona)
```

Esto es, una fuente es una función que toma una persona como parametro, y devuelve una persona.
De modo que, para aplicar la fuente a una persona uno pueda por ejemplo, si definimos:

```hs
fuenteSorda :: Fuente
fuenteSorda = queTodoSigaIgual
```

hacer:

```hs
fuenteSorda persona
```

Esto se hizo debido a que fuenteGanadora nos pide determinar, dado un set de funciones de parámetros iguales (que se aplican a los mismos parámetros, y devuelven lo mismo), cual es la ganadora.
De allí que modelar el tipo Fuente sea de utilidad.

## Punto 6

### ¿Dónde aparecen los conceptos de aplicación parcial y orden superior? Justifique.

#### Aplicacion Parcial:

fuenteSorda, fuenteAPedido, fuenteCopada. Estas tres llevan aplicacion parcial al llamar a sus respectivas funciones dentro de su definicion con ningun parametro estando estas definidas con parametros explicitos (las funciones son eliminarSuenos, cumplirSuenosPersona, cumplirSuenoPorIndice, cumplir, queTodoSigaIgual). 

tieneSuenoValioso y tieneSuenoRaro, por ser el mismo caso presentado anteriormente.

En obtenerSuenosPorFiltro se utiliza aplicación parcial en ($ persona) puesto que $ recibe una función y un parámetro y la aplica, pero sólo se le está pasando el parámetro y no la función.

#### Orden Superior:

fuenteGanadora, aplicarCriterio, obtenerSuenosPorFiltro son funciones que ejemplifican el uso de orden superior ya que esperan una función como parametro, para luego aplicala. Por otro lado, cuando utilizamos funciones como foldl1, filter y map estamos haciendo uso de orden superior por la misma razón que los casos anteriores.

Otras funciones en las que se utiliza orden superior son criterio1, criterio2, criterio3, por tomar fuentes (funciones) como parametro.

### ¿Cómo se relacionan las soluciones de los puntos 5 y el 6 respecto al concepto de declaratividad? Justificar.

Cuando tenemos un código declarativo, podemos entender que es lo que hace sin ver en detalle el algoritmo implementado. 

En este marco, el punto 6 es más declarativo que el 5 ya que, no sólo por sus nombres (tieneSuenoValioso, tieneSuenoRaro, felicidadTotal) podemos entender qué es lo que harán esas funciones si no que, además, al leer el código, resulta ser de simple comprensión.

Por otro lado, las funciones del punto 5 nos llevan a tener que leer un código obfuscado por el uso de guardas y variables auxiliares donde, ni los nombres, ni la lógica del código (a simple vista), nos informa que hace cada criterio.

En vistas de lo anterior, una descripción del comportamiento de cada criterio ayudaría a su comprensión y mantenibilidad.

### Desarollar

Para cada integrante, teniendo en cuenta el requerimiento que le tocó al modelar la fuente en el punto 4, ¿es posible que la fuente pueda satisfacer (es decir, cumplir el/los deseos) a esa persona que tiene infinitos sueños? Justificar su respuesta con un ejemplo concreto: “a esta persona P0 con infinitos sueños S0 y la Fuente F1 la invoco en la consola y... (etc. etc. etc.)” y relacionarlo con algún concepto visto en la cursada.

#### Integrante 1: 

Si, es posible que lo haga pero fallarían los tests ya que debe cumplir el primer sueño S1 y quitarlo de la lista, por lo cual la funcion podria realizarlo ya que lo que no conocemos de una lista infinita es su final pero si su inicio, que es lo que nos interesa; por otro lado, los test fallarían debido a que si tuvieramos la funcion F que cumple el sueño S1 de una lista de sueños L, tendriamos inicialmente length L = infinito y luego de aplicar F a L (quitando S1) length L = infinito - 1 = infinito

#### Integrante 2: 

No, no es posible que la fuenteCopada realice dicha tarea debido a que esta fuente intenta cumplir todos los sueños de manera que si teniendo la persona P0, con los infinitos sueños S0, se la invoca, la fuente primeramente invoca a cumplirSuenosPersona (con una persona pasada como argumento parcialmente) cuya labor es cumplirle todos los sueños a la persona y luego devolver una Persona P1 (igual a P0 pero con los felicidonios que le corresponden de sus sueños) la cual sera pasada a eliminarSuenos por la composicion aplicada a estas dos funciones. Debido a que cumplirSuenosPersona nunca terminará y por tanto, nunca devolverá una persona, eliminarSuenos no puede actuar y fuenteCopada finalmente no puede realizar la accion que requeriamos.

#### Integrante 3: 

Si, es capaz de hacerlo. Al ser un unico sueño (el que hay que cumplir), de una lista infinita, se puede ir a buscarlo y cumplirlo sin problemas. no nos interesan el resto de infinitos sueños. Los tests, por su parte, no podrán realizar su tarea correctamente ya que al ser una lista infinita el programa permanecerá infinitamente contando la cantidad de sueños pues length suenos = infinito, si se quisiere testear cada sueño. 
