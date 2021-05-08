module Spec where
import PdePreludat
import Library
import Test.Hspec

pokerDeAses    = [(1,"Corazones"), (1,"Picas"), (1,"Tréboles"), (1,"Diamantes"), (10,"Diamantes")]
fullDeJokers   = [(11,"Corazones"), (11,"Picas"), (11,"Tréboles"), (10,"Diamantes"), (10,"Picas")]
piernaDeNueves = [(9,"Corazones"), (9,"Picas"), (9,"Tréboles"), (10,"Diamantes"), (4,"Copas")]
fullColor   = [(4,"Picas"), (5,"Picas"), (2,"Picas"), (6,"Picas"), (7,"Picas")]

{-
jamesBond = Jugador {
    nombre = "Bond... James Bond",
    mano = pokerDeAses,
    bebida = "Martini... shaken, not stirred"
}

leChiffre = Jugador "Le Chiffre" fullDeJokers "Gin"

felixLeiter = Jugador {
    mano = piernaDeNueves,
    bebida = "Whisky",
    nombre = "Felix Leiter"
}

mesa1 = [jamesBond, leChiffre, felixLeiter]
-}

correrTests :: IO ()
correrTests = hspec $ do
  describe "Casino Royale" $ do

    it "1.a El mayor según valor absoluto entre -10 y 4 es -10" $ do

        mayorSegun abs (-10) 4 `shouldBe` (-10)

    it "1.a El mayor según valor absoluto entre 4 y (-10) es (-10)" $ do

        mayorSegun abs 4 (-10) `shouldBe` (-10)

    it "1.b El máximo de las lista [1, 2, (-3)] según el valor absoluto es -3" $ do

        maximoSegun abs [1, 2, (-3)] `shouldBe` (-3)

    it "1.c La lista [1, 2, (-3), 1, 1, 2 ,2] sin repetidos es [1, 2,(-3)]" $ do

        sinRepetidos [1, 2, (-3), 1, 1, 2 ,2] `shouldBe` [1, 2, (-3)]

    it "2.a esoNoSeVale se cumple para el 4 de copas" $ do

        (4, "Copas") `shouldSatisfy` esoNoSeVale

    it "2.a esoNoSeVale NO se cumple para el 1 de Corazones" $ do

        (1, "Corazones") `shouldNotSatisfy` esoNoSeVale

    it "2.b Felix Leiter tiene una mano negra" $ do

        let felixLeiter = Jugador {
            mano = piernaDeNueves,
            bebida = "Whisky",
            nombre = "Felix Leiter"
        }

        felixLeiter `shouldSatisfy` manoNegra

    it "2.b James Bond NO tiene una mano negra" $ do

        let jamesBond = Jugador {
            nombre = "Bond... James Bond",
            mano = pokerDeAses,
            bebida = "Martini... shaken, not stirred"
        }

        jamesBond `shouldNotSatisfy` manoNegra

    it "2.a En la mano fullDeJokers el jugador tiene un par" $ do

        fullDeJokers `shouldSatisfy` parCartas

    it "2.a En la mano fullColor el jugador NO tiene un par" $ do

        fullColor `shouldNotSatisfy` parCartas

    it "2.b En la mano piernaDeNueves el jugador tiene pierna" $ do

        piernaDeNueves `shouldSatisfy` piernaCartas

    it "2.a En la mano fullColor el jugador NO tiene una pierna" $ do

        fullColor `shouldNotSatisfy` piernaCartas

    it "2.c En la mano fullColor el jugador tiene color" $ do

        fullColor `shouldSatisfy` colorCartas

    it "2.c En la mano pokerDeAses el jugador NO tiene color" $ do

        pokerDeAses `shouldNotSatisfy` colorCartas

    it "2.d En la mano fullDeJokers el jugador tiene fullHouse" $ do

        fullDeJokers `shouldSatisfy` fullHouseCartas

    it "2.d En la mano pokerDeAses el jugador NO tiene fullHouse" $ do

        pokerDeAses `shouldNotSatisfy` fullHouseCartas

    it "2.e En la mano pokerDeAses el jugador tiene poker" $ do

        pokerDeAses `shouldSatisfy` pokerCartas

    it "2.e En la mano fullColor el jugador NO tiene poker" $ do

        fullColor `shouldNotSatisfy` pokerCartas

    it "2.f En la mano fullColor el jugador tiene otro juego" $ do

        fullColor `shouldSatisfy` otroCartas
