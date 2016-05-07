module PropTests.Fibonacci ( prop_fib ) where

import           PropTests.PropImports

prop_fib :: Spec
prop_fib = do
  describe "QuickCheck test fibonacci generator" $
    modifyMaxSuccess (const 1000)                $
    prop "Lowerbound: 1 Upperbound: 10000"       $
    forAll (choose (1, 10000)) testfib

testfib :: Integer -> Bool
testfib = isFib . fibb

isFib :: Integer -> Bool
isFib n = n == a where (_, a, _) = unFib (1, 1) n

unFib :: (Integer, Integer) -> Integer -> (Integer,Integer,Integer)
unFib (a, b) n
  | n < a = (0, 0, 1)
  | n < e = (2*k, c, d)
  | otherwise = (2*k + 1, e, f)
      where
        (k, c, d) = unFib (fibPlus (a, b) (a, b)) n
        (e, f)    = fibPlus (a, b) (c, d)

fibPlus :: (Integer, Integer) -> (Integer, Integer) -> (Integer,Integer)
fibPlus (a, b) (c, d) = (bd - (b - a)*(d - c), a*c + bd)
  where bd = b*d
