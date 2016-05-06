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
      -- computes fizzbuzz
      fizzbuzz
      -- computes fibonacci , 
    , fibb
      -- The driver function
    , fizzBuzzFib
    ) where

import BasicPrelude
import Data.Semigroup (Option (..), getOption)
import Data.Numbers.Primes (isPrime)

import FizzTypes
import Input

-- Based on http://dave.fayr.am/posts/2012-10-4-finding-fizzbuzz.html
fizzbuzz :: Integer -> Either FizzError Text
fizzbuzz i = Right $ fromMaybe (show i) $ getOption fizzbuzz'
  where
    fizzbuzz' :: Option Text 
    fizzbuzz' =
      ["Buzz "        | i `rem` 3 == 0] <>
      ["Fizz "        | i `rem` 5 == 0] <>
      ["BuzzFizz"     | isPrime i     ]

-- see https://wiki.haskell.org/The_Fibonacci_sequence#Fastest_Fib_in_the_West



-- fibb :: Integer -> Either FizzError Integer
-- fibb n = Right $ snd . foldl' fib' (1, 0) . map (toEnum . fromIntegral) $ unfoldl divs n
--  where
--    unfoldl f x =
--      case f x of
--        Nothing     -> []
--        Just (u, v) -> unfoldl f v ++ [u]

--    divs 0 = Nothing
--    divs k = Just (uncurry (flip (,)) (k `divMod` 2))

--    fib' (f, g) p
--      | p         = (f*(f+c*g), f^c + g^c)
--      | otherwise = (f^c+g^c,   g*(c*f-g))
--      where
--        c :: Integer
--        c = 2

-- Driver function performs following
-- (1) checks that input is proper
-- (2) creates integer list for fibonacci generator
-- (3) calculates first x in fibonnaci sequence
-- (4) generates fizzbuzz output using (3)
fizzBuzzFib :: [Text] -> Either FizzError [Text]
fizzBuzzFib str =
  mapM fizzbuzz           =<<
  mapM fibb               =<<
  (\x -> Right [1 .. x])  =<<
  convertToPInt           =<<
  mustHaveOne str
