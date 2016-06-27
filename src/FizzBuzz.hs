{-# LANGUAGE MonadComprehensions #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Module: FizzBuzz
-- Copyright: Copyright (C) 2016 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
-- Fizzbuzz generation functions

module FizzBuzz
  (
    fizzbuzz
   -- | computes fizzbuzz
  ) where

import BasicPrelude
import Data.Semigroup (Option (..), option)
import Data.Numbers.Primes (isPrime)

-- | 
-- Based on http://dave.fayr.am/posts/2012-10-4-finding-fizzbuzz.html
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
