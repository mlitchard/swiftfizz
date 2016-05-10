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

import           Data.Numbers.Primes (isPrime)
import           PropTests.PropImports

-- |
-- tests that FizzBuzz is doing the right thing
propFizz :: Int -> Spec
propFizz ub = do
  describe "QuickCheck testing fizbuzz"     $
    modifyMaxSuccess (const ub)             $
    prop propMsg                            $
    forAll (choose (0, ub)) modFiz
  where
    propMsg = "Lowerbound: 0 Upperbound: " <> showUB
    showUB = (unpack . show) ub

-- |
-- The actual property test
modFiz :: Integer -> Bool
modFiz int
  | int == 3                                 = test3
  | int == 5                                 = test5
  | int `mod` 15 == 0                        = testMod35
  | int `mod` 3 == 0                         = testMod3
  | int `mod` 5 == 0                         = testMod5
  | isPrime int == True                      = testPrime
  | otherwise                                = testRest
      where
        test3     =
          "Buzz BuzzFizz"     == fizzbuzz 3
        test5     =
          "Fizz BuzzFizz"     == fizzbuzz 5
        testMod3  =
          "Buzz "             == fizzbuzz int
        testMod5  =
          "Fizz "             == fizzbuzz int
        testMod35 =
          "Buzz Fizz "        == fizzbuzz int
        testPrime =
          "BuzzFizz"          == fizzbuzz int
        testRest  =
          (show int)          == fizzbuzz int 
