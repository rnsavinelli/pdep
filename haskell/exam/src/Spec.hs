module Spec where
import PdePreludat
import Library
import Definitions
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de cobro:" $ do
    it "El cobro de 25 CurryCoins fue exitoso." $ do
      let cuentaTarget = Cuenta "XHD327H9H9DA" 100
      let coins = 25
      saldo (cobro coins cuentaTarget) `shouldBe` 125

  describe "Test de pago:" $ do
    it "El pago de 25 CurryCoins fue exitoso." $ do
      let cuentaTarget = Cuenta "XHD327H9H9DA" 100
      let coins = 25
      saldo (pago coins cuentaTarget) `shouldBe` 75

  describe "Test de mineria:" $ do
    it "Se minó un CurryCoin." $ do
      let cuentaTarget = Cuenta "XHD327H9H9DA" 100
      (saldo . mineria) cuentaTarget `shouldBe` 125    

  describe "Test de isCuenta con cuentaTarget = Cuenta \"XHD327H9H9DA\" 100" $ do
    it "El identificador \"XHD327H9H9DA\" identifica a la cuenta." $ do
      let cuentaTarget = Cuenta "XHD327H9H9DA" 100
      isCuenta "XHD327H9H9DA" cuentaTarget `shouldBe` True

    it "El identificador \"AB2RJIODE932\" NO identifica a la cuenta." $ do
      let cuentaTarget = Cuenta "XHD327H9H9DA" 100
      isCuenta "AB2RJIODE932" cuentaTarget `shouldBe` False 