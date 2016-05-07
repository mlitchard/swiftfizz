module UnitTests.Fibonacci ( unit_fib ) where

import           UnitTests.UnitImports

unit_fib :: Spec
unit_fib = do
  describe "Fibonacci check" $
    it "returns a list of integers each wrapped in a Right constructor" $
      map fibb [1 .. 10] `shouldBe` fibs

fibs :: [Integer]
fibs =
  [1,1,2,3,5,8,13,21,34,55]
