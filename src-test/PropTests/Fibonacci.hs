-- |
-- Module: PropTests.Fibonacci
-- Copyright: Copyright (C) 2016 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
  
-- Fibonacci property tests
module PropTests.Fibonacci ( propFib ) where

import           PropTests.PropImports


propFib :: Integer -> Spec
propFib ub = do
  describe "QuickCheck test fibonacci generator" $
    modifyMaxSuccess (const 10000)                $
    prop "Lowerbound: 0 Upperbound: 10000"       $
    forAll fibNumber isFib
  where
    fibNumber = elements $ fibSeq ub

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
