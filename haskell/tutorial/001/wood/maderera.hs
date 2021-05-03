esPar = even

cuadruple numero = 4 * numero

largoListon = 300

maderaParaCuadro = cuadruple

meAlcanza largo = largo <= largoListon

puedoHacerCuadroDe lado = meAlcanza (maderaParaCuadro lado)

puedoHacerCuadroDe' = meAlcanza . maderaParaCuadro

cuantoSobra largo = largoListon - largo

porcentajeDeListon largo = (largo / largoListon) * 100

quePorcetajeSobra = porcentajeDeListon . cuantoSobra . maderaParaCuadro
