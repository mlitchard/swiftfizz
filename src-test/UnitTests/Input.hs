{-# LANGUAGE OverloadedStrings #-}
module UnitTests.Input ( unitInput ) where

import           UnitTests.UnitImports

unitInput :: Spec
unitInput = do
  describe "Correct Response To Bad Input" $ do
    it "returns (NoInput :: FibError)" $
      input [] `shouldBe` (Left NoInput)
    it "returns (OnlyOne :: FibError)" $
      input ["10","20"] `shouldBe` (Left OnlyOne)
    it "returns (NotAnInteger :: FibError)" $
      input buffalo `shouldBe` (Left NotAnInteger)

input :: [Text] -> Either FizzError Integer
input x = convertToPInt =<< mustHaveOne x

buffalo :: [Text]
buffalo = ["Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo"]
