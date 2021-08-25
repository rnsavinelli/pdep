# Parcial de Lógico :: ¡JJOO de Carpinchos!

Esta cuarentena estuvo bastante desbalanceada, hubo mucho de unas cosas y poco de otras. Y para esta edición queremos juntar dos de esos extremos para balancear: Carpinchos (que hubo mucho) y JJOO (que hubo muy poco).
Por lo tanto vamos a tener Carpinchos que deben realizar distintas disciplinas.

De cada carpincho sabemos su nombre, una lista de habilidades (átomos) y sus atributos de fuerza, destreza y velocidad (que son números, siempre referidos en ese orden).
Tenemos los siguientes carpinchos:
* Kike: que sabe saltar y correr, y sus atributos son 100, 50, 40
* Nacho: sabe olfatear y saltar, y sus atributos son 60, 80, 80
* Alancito: sabe correr y sus atributos son 80, 80, 70
* Gastoncito: sabe olfatear y sus atributos son 100, 30, 20.
* Sofy: sabe saltar, correr, olfatear y sus atributos son 100, 90, 100.
  
Las disciplinas tienen distintos tipos de restricciones: 
* De habilidades: Define una lista de habilidades que tiene que tener el carpincho para poder participar.
* De atributos: Tiene valores de los atributos que tiene que cumplir el carpincho (donde el valor puede ser 0 si el mismo no es necesario)
* Mixtas: Combinación de las dos anteriores.
Además, todas tienen su nombre. Algunas de las disciplinas son:
1. Salto con Ramita: que tiene restricción de habilidades: correr y saltar
2. Armado de Madriguera: requiere 160 de destreza
3. Huida de Depredador: requiere saber correr, olfatear y una velocidad de por lo menos 80
A continuación se da el modelo de las disciplinas mencionadas: 
```Prolog
disciplina(armadoMadriguera, restriccionAtributos(0, 160, 0)).
disciplina(saltoConRamita, restriccionHabilidades([saltar, correr])).
disciplina(huidaDepredador, restriccionMixta(restriccionAtributos(0, 0, 80), restriccionHabilidades([olfatear, correr]))).
```
Resolver haciendo que todos los predicados solicitados sean inversibles salvo que se indique lo contrario.
Aclaración: No es necesario que los predicados auxiliares sean inversibles.

1. Modelar con functores a cada uno de los carpinchos y definir un predicado para indicar la existencia y poder usar de generador.

2. Saber si una disciplina, dado su nombre, es difícil: Esto ocurre cuando se requieren más de 2 habilidades o bien suma más de 300 puntos de atributos.

3. Implementar un predicado que relacione a un carpincho y el nombre de una disciplina, si el primero puede realizarla.

4. Saber si un carpincho es extraño, esto pasa cuando todas las disciplinas que puede realizar son difíciles.

5. Saber, dados dos carpinchos y el nombre de una disciplina, cuál es el ganador, sabiendo que: 
   * Si los dos pueden participar en la disciplina, gana el que tenga más sumatoria de atributos.
   * Si uno solo puede participar, es el ganador.
   * Si ninguno participa, ninguno gana.  
	Nota: Pensar... ¿Cuántas cosas se deben relacionar?

6. Durante la cuarentena, nuestros amiguitos estuvieron preparándose para este gran evento deportivo con distintos entrenamientos. Implementar los siguientes entrenamientos, que relacionan una cantidad, un carpincho y el mismo carpincho después de entrenar:
   1. pesasCarpinchas/3: aumenta la fuerza de un carpincho un cuarto de la cantidad de peso que levantaron
   2. atrapaLaRana/3: aumenta la destreza en igual cantidad que las ranas atrapadas
   3. cardiopincho/3: aumenta la velocidad el doble de los kilómetros recorridos (claramente en cinta, porque no podían salir)

    Nota: No hace falta que este predicado sea inversible para ninguno de los argumentos

7. Hacer aCuantosLesGana/3. Que relaciona un carpincho, nombre de disciplina y la cantidad de carpinchos a los que les gana en esa disciplina.

8. Queremos saber si entre nuestros atletas se encuentra el mítico “carpincho de oro”, que aparece una vez cada milenio y es aquel que les gana a todos los demás en todas las disciplinas.
