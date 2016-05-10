{-# LANGUAGE MonadComprehensions #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Module: FizzBuzz
-- Copyright: Copyright (C) 2015 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
--  
-- Fizzbuzz generation functions

module FizzBuzz
  ( 
    fizzbuzz
    -- | computes fizzbuzz
  , fizzBuzzFib
    -- | uses lazy fibb list to feed fizzbuzz function
  ) where

import BasicPrelude
import Data.Numbers.Primes (isPrime)
import Data.Semigroup (Option (..), option) 
import Control.Parallel.Strategies

import FizzFib

-- |
fizzBuzzFib :: Integer -> [Text]
fizzBuzzFib ub = parMap rdeepseq fizzbuzz $! fibSeq ub

-- | Based on http://dave.fayr.am/posts/2012-10-4-finding-fizzbuzz.html
-- optimized for scalability and maintainability
fizzbuzz :: Integer -> Text
fizzbuzz i =
  option (show i) id fizzbuzz' 
  where
    fizzbuzz' :: Option Text 
    fizzbuzz' =
      ["Buzz "        | i `rem` 3 == 0] <>
      ["Fizz "        | i `rem` 5 == 0] <>
      ["BuzzFizz"     | isPrime i     ]
