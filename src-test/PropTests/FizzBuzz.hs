{-# LANGUAGE OverloadedStrings #-}
-- |
-- Module: PropTests.FizzBuzz
-- Copyright: Copyright (C) 2016 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
-- Property tests for FizzBuzz

module PropTests.FizzBuzz ( propFizz ) where

import Data.Text (unpack)
import Math.NumberTheory.Primes.Testing (isPrime) 

import PropTests.PropImports

-- |
-- tests that FizzBuzz is doing the right thing
-- maxSuccess is one order lower than upper bound.
-- So, an upper bound of 10,000 will result in 1000 tests being done.
-- keep in mind that this number needs to be within range of Int
propFizz :: Int -> Spec
propFizz ub = do
  describe "QuickCheck testing fizbuzz"     $
    modifyMaxSuccess (const maxS)           $
    prop propMsg                            $
    forAll (choose (0, ub)) modFiz
  where
    propMsg = "Lowerbound: 0 Upperbound: " <> showUB
    showUB = (unpack . show) ub
    maxS   = (ub `div` 10) :: Int

-- |
-- The actual property test
-- Note that although it is using same input as the Fibonacci test
-- it is not testing the nth Fibonacci number.
-- This is the next improvement to be made.
modFiz :: Int -> Bool
modFiz int
  | int == 3                                 = test3
  | int == 5                                 = test5
  | int `mod` 15 == 0                        = testMod35
  | int `mod` 3 == 0                         = testMod3
  | int `mod` 5 == 0                         = testMod5
  | isPrime integer == True                  = testPrime
  | otherwise                                = testRest
      where
        integer = toInteger int
        test3     =
          "Buzz BuzzFizz"     == fizzbuzz 3
        test5     =
          "Fizz BuzzFizz"     == fizzbuzz 5
        testMod3  =
          "Buzz "             == fizzbuzz integer
        testMod5  =
          "Fizz "             == fizzbuzz integer
        testMod35 =
          "Buzz Fizz "        == fizzbuzz integer
        testPrime =
          "BuzzFizz"          == fizzbuzz integer
        testRest  =
          (show int)          == fizzbuzz integer
      
