{-# LANGUAGE OverloadedStrings #-}
-- |
-- Module: PropTests.Fibonacci
-- Copyright: Copyright (C) 2016 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
  
-- Fibonacci property tests
module PropTests.Fibonacci ( propFib ) where

import Data.Text (unpack)
import PropTests.PropImports

-- | Tests that fibonacci generator is generating correct Fibonacci 
-- sequence up to upper bound.
propFib :: Int -> Spec
propFib ub = do
  describe "QuickCheck test fibonacci generator"   $
    modifyMaxSuccess (const maxS)                  $
    prop propMsg                                   $
    forAll fibNumber isFib
  where
    fibNumber = elements $ fibSeq ub
    propMsg   = "Lowerbound: 0 Upperbound: " <> showUB
    showUB = (unpack . show) ub
    maxS   = (ub `div` 10) :: Int

-- |
-- This is a Fibonacci number tester I found here
-- https://www.quora.com/What-is-the-most-efficient-algorithm-to-check-if-a-number-is-a-Fibonacci-Number

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
