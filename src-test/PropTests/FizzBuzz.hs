{-# LANGUAGE OverloadedStrings #-}

module PropTests.FizzBuzz ( prop_fizz ) where

import           Data.Numbers.Primes (isPrime)
import           PropTests.PropImports

prop_fizz :: Spec
prop_fizz = do
  describe "QuickCheck testing fizbuzz"     $
    modifyMaxSuccess (const 1000)           $
    prop  "Lowerbound: 0 Upperbound: 10000" $
    forAll (choose (1, 10000)) modfiz

modfiz :: Integer -> Bool
modfiz int
  | int == 3                                 = test3
  | int == 5                                 = test5
  | int `mod` 15 == 0                        = testMod35
  | int `mod` 3 == 0                         = testMod3
  | int `mod` 5 == 0                         = testMod5
  | isPrime int == True                      = testPrime
  | otherwise                                = testRest
      where
        test3     =
          Right "Buzz BuzzFizz"     == fizzbuzz 3
        test5     =
          Right "Fizz BuzzFizz"     == fizzbuzz 5
        testMod3  =
          Right "Buzz "             == fizzbuzz int
        testMod5  =
          Right "Fizz "             == fizzbuzz int
        testMod35 =
          Right "Buzz Fizz "        == fizzbuzz int
        testPrime =
          Right "BuzzFizz"          == fizzbuzz int
        testRest  =
          Right (show int)          == fizzbuzz int 
