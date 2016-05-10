-- |
-- Module: FizzFib
-- Copyright: Copyright (C) 2016 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
-- Efficient Fibonacci sequence generator

module FizzFib (fibSeq) where

import BasicPrelude

-- | Take Fibonacci sequence up to upper bound
fibSeq :: Int -> [Integer]
fibSeq ub = genericTake ub fibb

-- | https://wiki.haskell.org/The_Fibonacci_sequence#Canonical_zipWith_implementation
fibb :: [Integer]
fibb = 0 : 1 : zipWith (+) fibb (tail fibb) 
