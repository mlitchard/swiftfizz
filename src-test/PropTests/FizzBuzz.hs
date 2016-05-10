{-# LANGUAGE OverloadedStrings #-}

module PropTests.FizzBuzz ( propFizz ) where

import           Data.Numbers.Primes (isPrime)
import           PropTests.PropImports

propFizz :: Spec
propFizz = do
  describe "QuickCheck testing fizbuzz"     $
    modifyMaxSuccess (const 10000)           $
    prop  "Lowerbound: 0 Upperbound: 10000" $
    forAll (choose (0, 100000)) modFiz

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
