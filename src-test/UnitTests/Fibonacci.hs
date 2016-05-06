module UnitTests.Fibonacci ( unit_fib ) where

import           UnitTests.UnitImports

unit_fib :: Spec
unit_fib = do
  describe "Fibonacci check" $
    it "returns a list of integers each wrapped in a Right constructor" $
      map fibb [1 .. 10] `shouldBe` fibs

fibs :: [Either FizzError Integer]
fibs =
  [Right 1,Right 1,Right 2,Right 3,Right 5,Right 8,Right 13,Right 21,Right 34,Right 55]
