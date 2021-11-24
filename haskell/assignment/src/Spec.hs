module Spec where
import PdePreludat
import Library
import Persona
import Fuente
import Test.Hspec

correrTests :: IO ()

correrTests = hspec $ do

  -- Punto 1 ------------------------------------------------------------------

  describe "\nTest de coeficienteDeSatisfaccion" $ do

    it "El coeficiente de satisfacción de una persona muy felíz con 101 felicidonios y 25 años es 2525." $ do
      let personaMuyFeliz = Persona 25 [] "" 101 []
      coeficienteDeSatisfaccion personaMuyFeliz `shouldBe` 2525

    it "El coeficiente de satisfacción de una persona moderadamente felíz con 100 felicidonios y 2 sueños es 200." $ do
      let personaModeradamenteFeliz = Persona 0 [Viajar "Londres", Recibirse "Abogacía"] "" 100 []
      coeficienteDeSatisfaccion personaModeradamenteFeliz `shouldBe` 200

    it "El coeficiente de satisfacción de una persona poco felíz con 50 felicidonios es 25." $ do
      let personaPocoFeliz = Persona 0 [] "" 50 []
      coeficienteDeSatisfaccion personaPocoFeliz `shouldBe` 25

  describe "\nTest de gradoDeAmbicion" $ do

    it "El grado de ambición de una persona muy felíz con 101 felicidonios y 2 sueños es 202." $ do
      let personaMuyFeliz = Persona 0 [Viajar "París", Recibirse "Ingeniería"] "" 101 []
      calcularAmbicion personaMuyFeliz `shouldBe` 202

    it "El grado de ambición de una persona moderadamente felíz con 100 felicidonios, 26 años y 2 sueños es 52." $ do
      let personaModeradamenteFeliz = Persona 26 [Viajar "Londres", Recibirse "Abogacía"] "" 100 []
      calcularAmbicion personaModeradamenteFeliz `shouldBe` 52

    it "El grado de ambición de una persona poco felíz con 50 felicidonios y 1 sueño es 2." $ do
      let personaPocoFeliz = Persona 0 [Viajar "Moscú"] "" 50 []
      calcularAmbicion personaPocoFeliz `shouldBe` 2

  -- Punto 2 ------------------------------------------------------------------

  describe "\nTest de nombreLargo" $ do

    it "Una persona que se llama Evangelina NO tiene nombre largo." $ do
      let personaNombreNormal = Persona 0 [] "Evangelina" 0 []
      tieneNombreLargo personaNombreNormal `shouldBe` False

    it "Una persona que se llama Maximiliano SI tiene nombre largo." $ do
      let personaNombreLargo = Persona 0 [] "Maximiliano" 0 []
      tieneNombreLargo personaNombreLargo `shouldBe` True

  describe "\nTest de esSuertuda" $ do

    it "Una persona NO suertuda, que tiene 14 felicidonios." $ do
      let personaNoSuertuda = Persona 0 [] "" 14 []
      esSuertuda personaNoSuertuda `shouldBe` False

    it "Una persona suertuda, que tiene 12 felicidonios." $ do
      let personaSuertuda = Persona 0 [] "" 12 []
      esSuertuda personaSuertuda `shouldBe` True

  describe "\nTest de tieneNombreLindo" $ do

    it "Una persona que se llama Ariel NO tiene nombre lindo." $ do
      let personaSinNombreLindo = Persona 0 [] "Ariel" 0 []
      tieneNombreLindo personaSinNombreLindo `shouldBe` False

    it "Una persona que se llama Melina tiene nombre lindo." $ do
      let personaNombreLindo = Persona 0 [] "Melina" 0 []
      tieneNombreLindo personaNombreLindo `shouldBe` True

  -- Punto 3 ------------------------------------------------------------------

  describe "\nTest de cumplirSuenosPersona" $ do

    it "Una persona sueña solo RECIBIRSE de chef, sin felicidonios ni habilidades, recibe 60 felicidonios y la habilidad \"Chef\"." $ do
      let personaFuturoChef = Persona 0 [Recibirse "Chef"] "" 0 []
      (felicidonios . cumplirSuenosPersona) personaFuturoChef `shouldBe` 60
      (habilidades . cumplirSuenosPersona) personaFuturoChef `shouldBe` ["Chef"]

    it "Una persona que NO SUEÑA nada y no tiene ni felicidonios ni habilidades, no cambia." $ do
      let personaSinSuenos = Persona 0 [] "" 0 []
      (edad . cumplirSuenosPersona) personaSinSuenos`shouldBe` edad personaSinSuenos
      (felicidonios . cumplirSuenosPersona) personaSinSuenos`shouldBe` felicidonios personaSinSuenos
      (habilidades . cumplirSuenosPersona) personaSinSuenos`shouldBe` habilidades personaSinSuenos

    it "Una persona solo sueña VIAJAR a 2 lugares y tiene 100 felicidonios, termina con 300 felicidonios y dos años más." $ do
      let personaSuenaDosViajes = Persona 26 [Viajar "Londres", Viajar "Berlin"] "" 100 []
      (felicidonios . cumplirSuenosPersona) personaSuenaDosViajes `shouldBe` 300
      (edad . cumplirSuenosPersona) personaSuenaDosViajes `shouldBe` 28

    it "Una persona con 100 felicidonios, que sueña solo ENAMORARSE de su crush con 75 felicidonios, termina con 175 felicidonios." $ do
      let crush = Persona 0 [] "" 75 []
      let personaEnamoradaDeCrush = Persona 0 [Enamorarse crush] "" 100 []
      (felicidonios . cumplirSuenosPersona) personaEnamoradaDeCrush `shouldBe` 175

    it "Su crush con 75 felicidonios, que NO SUEÑA ENAMORARSE de la persona enamorada de él, termina con 75 felicidonios." $ do
      let crush = Persona 0 [] "" 75 []
      let personaEnamorada = Persona 0 [Enamorarse crush] "" 100 []
      (felicidonios . cumplirSuenosPersona) crush `shouldBe` 75

    it "Una persona conformista con 10 felicidonios termina con 10 felicidonios." $ do
      let personaConformista = Persona 0 [Otro "Que todo siga igual"] "" 10 []
      (felicidonios . cumplirSuenosPersona) personaConformista `shouldBe` 10

    it "Una persona sin felicidonios que sueña VIAJAR a 3 lugares, ENAMORARSE de otra persona con 25 felicidonios y RECIBIRSE de Ingenieria y Veterinaria, termina con 540 felicidonios, 3 años más y las habilidades Veterinaria e Ingenieria." $ do
      let crush = Persona 0 [] "" 25 []
      let personaConMuchosSuenos = Persona 0 [Viajar "Londres", Viajar "Berlin", Viajar "París", Recibirse "Ingenieria", Recibirse "Veterinaria", Enamorarse crush] "" 0 []
      (edad . cumplirSuenosPersona) personaConMuchosSuenos `shouldBe` 3
      (felicidonios . cumplirSuenosPersona) personaConMuchosSuenos `shouldBe` 640
      (habilidades . cumplirSuenosPersona) personaConMuchosSuenos `shouldBe` ["Veterinaria", "Ingenieria"]

    it "El COMBO PERFECTO devuelve una pesona con 2 años más y 420 felicidonios más." $ do
      let personaComboPerfecto = Persona 0 [] "" 0 []
      (felicidonios . comboPerfecto) personaComboPerfecto `shouldBe` 420
      (edad . comboPerfecto) personaComboPerfecto `shouldBe` 2

  -- Punto 4 ------------------------------------------------------------------

  describe "\nTest de fuenteAPedido" $ do

    it "Una persona con varios sueños, al cumplirse el segundo, recibe los felicidonios de cumplirse el segundo sueño." $ do
      let indice = 2
      let personaConVariosSuenos = Persona 0 [Viajar "Londres", Recibirse "Ingenieria", Recibirse "Veterinaria"] "" 0 []
      felicidonios (fuenteAPedido indice personaConVariosSuenos) `shouldBe` 165
      habilidades (fuenteAPedido indice personaConVariosSuenos) `shouldBe` ["Veterinaria"]
      edad (fuenteAPedido indice personaConVariosSuenos) `shouldBe` 0

    it "La cantidad de sueños no cambia." $ do
      let indice = 2
      let personaConVariosSuenos = Persona 0 [Viajar "Londres", Recibirse "Ingenieria", Recibirse "Veterinaria"] "" 0 []
      length (suenos (fuenteAPedido indice personaConVariosSuenos)) `shouldBe` 3

  describe "\nTest de fuenteCopada" $ do

    it "Una persona que sueña viajar a Londres y recibirse de Ingenieria y Veterinaria, al aplicarse FuenteCopada recibe 415 felicidonios." $ do
      
      let personaConVariosSuenos = Persona 0 [Viajar "Londres", Recibirse "Ingenieria", Recibirse "Veterinaria"] "" 0 []
      felicidonios (fuenteCopada personaConVariosSuenos) `shouldBe` 415
      habilidades (fuenteCopada personaConVariosSuenos) `shouldBe` ["Veterinaria", "Ingenieria"]
      edad (fuenteCopada personaConVariosSuenos) `shouldBe` 1

    it "La cantidad de sueños es nula." $ do
      
      let personaConVariosSuenos = Persona 0 [Viajar "Londres", Recibirse "Ingenieria", Recibirse "Veterinaria"] "" 0 []
      suenos (fuenteCopada personaConVariosSuenos) `shouldBe` []
      length (suenos (fuenteCopada personaConVariosSuenos)) `shouldBe` 0

  describe "\nTest de fuenteSorda" $ do

    it "Una persona que sueña viajar a Londres y recibirse de Ingenieria y Veterinaria, al aplicarse FuenteCopada no cambia." $ do
      let personaConVariosSuenos = Persona 0 [Viajar "Londres", Recibirse "Ingenieria", Recibirse "Veterinaria"] "" 0 []
      fuenteSorda personaConVariosSuenos `shouldBe` personaConVariosSuenos

  -- Punto 5 ------------------------------------------------------------------

  --describe "\nTest de fuenteGanadora" $ do

    --it "Utilizando el criterio1 (la fuente que da mas felicidonios) la fuente ganadora es la fuente copada" $ do
      --let personaConVariosSuenos = Persona 0 [Viajar "Londres", Recibirse "Ingenieria", Recibirse "Veterinaria"] "" 0 []
      --let fuentes = [fuenteSorda, fuenteAPedido 2, fuenteCopada]
      --fuenteGanadora fuentes personaConVariosSuenos criterio1 `shouldBe` fuenteCopada

  -- Punto 6 ------------------------------------------------------------------

  describe "\nTest de tieneSuenoRaro" $ do

    it "Una persona que sueña recibirse de una carrera desconocida tiene un sueño raro." $ do
      let personaConCarreraDesconocida = Persona 0 [Viajar "Londres", Recibirse "Ingenieria", Recibirse ""] "" 0 []
      tieneSuenoRaro personaConCarreraDesconocida `shouldBe` [Recibirse ""]

    it "Una persona que sueña enamorarse de una persona sin felicidonios tiene un sueño raro." $ do
      let crush = Persona 0 [] "" 0 []
      let personaConCrushInfeliz = Persona 0 [Viajar "Londres", Recibirse "Ingenieria", Enamorarse crush] "" 0 []
      tieneSuenoRaro personaConCrushInfeliz `shouldBe` [Enamorarse crush]

    it "Una persona que sueña viajar a Tokio y Recibirse de Medicina NO tiene sueños raros:" $ do
      let personaConCarreraDesconocida = Persona 0 [Viajar "Tokio", Recibirse "Medicina"] "" 0 []
      tieneSuenoRaro personaConCarreraDesconocida `shouldBe` []

  describe "\nTest de tieneSuenoValioso" $ do

    it "Una persona que sueña recibirse de ingenieria tiene un sueño valioso." $ do
      let personaConSuenoValioso = Persona 0 [Viajar "Londres", Recibirse "Ingenieria"] "" 0 []
      tieneSuenoValioso personaConSuenoValioso `shouldBe` [Recibirse "Ingenieria"]

  describe "\nTest de felicidadTotal" $ do

    it "La felicidad 4 personas que recibirian 100, 250, 615 y 60 felicidonios respectivamente, es 1025." $ do
      let persona1 = Persona 0 [Viajar "Tokio"] "" 0 []
      let persona2 = Persona 0 [Viajar "Amsterdam", Recibirse "Ingenieria"] "" 0 []
      let persona3 = Persona 0 [Viajar "Londres", Viajar "Berlin", Viajar "París", Recibirse "Ingenieria", Recibirse "Veterinaria"] "" 0 []
      let persona4 = Persona 0 [Recibirse "Chef"] "" 0 []

      let personas = [persona1, persona2, persona3, persona4]

      felicidadTotal personas `shouldBe` 1025
