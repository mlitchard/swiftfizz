module FizzFib (fibSeq) where

import BasicPrelude
import Control.Parallel.Strategies

-- | Take Fibonacci sequence up to upper bound
fibSeq :: Integer -> [Integer]
fibSeq ub = 
  withStrategy (parBuffer buffer rdeepseq) $ genericTake ub fibb
  where
    buffer = 100

-- | https://wiki.haskell.org/The_Fibonacci_sequence#Canonical_zipWith_implementation
fibb :: [Integer]
fibb = 0 : 1 : zipWith (+) fibb (tail fibb) 

