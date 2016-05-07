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
      -- | computes fizzbuzz
      fizzbuzz
      -- | computes fibonacci , 
    , fibb
      -- | The driver function
    , fizzBuzzFib
    ) where

import BasicPrelude
import Data.Numbers.Primes (isPrime)
import Data.Semigroup (Option (..), option) 

-- | Driver function performs following
--   (1) checks that input is proper
--   (2) creates integer list for fibonacci generator
--   (3) calculates first x in fibonnaci sequence
--   (4) generates fizzbuzz output using (3)
fizzBuzzFib :: Integer -> [Text]
fizzBuzzFib x =
  fizzbuzz         <$>
  fibb             <$>
  [1 .. x]        

-- | Based on http://dave.fayr.am/posts/2012-10-4-finding-fizzbuzz.html
fizzbuzz :: Integer -> Text
fizzbuzz i =
  option (show i) id fizzbuzz' 
  where
    fizzbuzz' :: Option Text 
    fizzbuzz' =
      ["Buzz "        | i `rem` 3 == 0] <>
      ["Fizz "        | i `rem` 5 == 0] <>
      ["BuzzFizz"     | isPrime i     ]

-- | see https://wiki.haskell.org/The_Fibonacci_sequence#Fastest_Fib_in_the_West
fibb :: Integer -> Integer
fibb = snd . foldl' fib' (1, 0) . map (>0) . reverse . unfoldr divs
  where
    divs :: Integer -> Maybe (Integer,Integer)
    divs 0 = Nothing
    divs k = Just (uncurry (flip (,)) (k `divMod` 2))

    fib' :: (Integer, Integer) -> Bool -> (Integer, Integer)
    fib' (f, g) p
      | p         = (f*(f+c*g), f^c + g^c)
      | otherwise = (f^c+g^c,   g*(c*f-g))
      where
        c :: Integer
        c = 2
-- | The `where` clause solves below error
--   Warning:
--      Defaulting the following constraint(s) to type ‘Integer’
--        (Integral b0) arising from a use of ‘^’ at src/FizzBuzz.hs:57:34
--        (Num b0) arising from the literal ‘2’ at src/FizzBuzz.hs:57:35
--      In the first argument of ‘(+)’, namely ‘f ^ 2’
--      In the expression: f ^ 2 + g ^ 2
--      In the expression: (f * (f + 2 * g), f ^ 2 + g ^ 2)
