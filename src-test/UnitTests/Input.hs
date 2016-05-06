{-# LANGUAGE OverloadedStrings #-}
module UnitTests.Input ( unit_input ) where

import           UnitTests.UnitImports

unit_input :: Spec
unit_input = do
  describe "Clean Input, Correct Control Structure" $ do
    it "returns (NoInput :: FibError)" $
      fizzBuzzFib [] `shouldBe` (Left NoInput)
    it "returns (OnlyOne :: FibError)" $
      fizzBuzzFib ["10","20"] `shouldBe` (Left OnlyOne)
    it "returns (NotAnInteger :: FibError)" $
      fizzBuzzFib buffalo `shouldBe` (Left NotAnInteger)

buffalo :: [Text]
buffalo = ["Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo"]
