{-# LANGUAGE OverloadedStrings, QuasiQuotes #-}
module Main (main) where
-- |
-- -- Module:      src-test/Main.hs
-- -- Copyright:   2016 Michael Litchard
-- -- License:     BSD3
-- -- Maintainer:  <Michael Litchard> <michael@schmong.org>
-- -- 
-- -- A few tests for fizzbuzz demo

import           Data.Numbers.Primes (isPrime)

import           Test.Hspec  (Spec,hspec,describe,it,shouldBe)
import           Test.Hspec.QuickCheck (prop)
import           Import

main :: IO ()
main = do
 hspec fzzbzz
 hspec qcheck
 hspec input

input :: Spec
input = do
  describe "Clean Input, Correct Control Structure" $ do
    it "returns (NoInput :: FibError)" $
      fizzBuzzFib [] `shouldBe` (Left NoInput)
    it "returns (OnlyOne :: FibError)" $
      fizzBuzzFib ["10","20"] `shouldBe` (Left OnlyOne)
    it "returns (NotAnInteger :: FibError)" $
      fizzBuzzFib buffalo `shouldBe` (Left NotAnInteger)

-- https://en.wikipedia.org/wiki/Buffalo_buffalo_Buffalo_buffalo_buffalo_buffalo_Buffalo_buffalo

buffalo :: [String]
buffalo = ["Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo Buffalo"]

fzzbzz :: Spec
fzzbzz = do
  describe "Fibonacci check" $
    it "returns a list of integers each wrapped in a Right constructor" $
      map fibb [1 .. 10] `shouldBe` fibs

fibs :: [Either FizzError Integer]
fibs =
  [Right 1,Right 1,Right 2,Right 3,Right 5,Right 8,Right 13,Right 21,Right 34,Right 55]

qcheck :: Spec
qcheck = do
  describe "QuickCheck test fiz" $
    prop "QuickCheck test" $ modfiz

  describe "QuickCheck test fib" $
    prop "QuickCheck test fib" $ testfib

modfiz :: Integer -> Bool
modfiz int
  | int <= 0                                 = True
  | int == 3                                 = test3
  | int == 5                                 = test5
  | int `mod` 15 == 0                        = testMod35
  | int `mod` 3 == 0                         = testMod3
  | int `mod` 5 == 0                         = testMod5
  | isPrime int == True                      = testPrime
  | otherwise                                = testRest
      where
        test3     =
          Right "Buzz BuzzFizz" == fizzbuzz 3
        test5     =
          Right "Fizz BuzzFizz" == fizzbuzz 5
        testMod3  =
          Right "Buzz "             == fizzbuzz int
        testMod5  =
          Right "Fizz "             == fizzbuzz int
        testMod35 =
          Right "Buzz Fizz "        == fizzbuzz int
        testPrime =
          Right "BuzzFizz"      == fizzbuzz int
        testRest  =
          Right (show int)          == fizzbuzz int

-- Test to see if a given integer is a Fibonnacci number
-- https://www.quora.com/What-is-the-most-efficient-algorithm-to-check-if-a-number-is-a-Fibonacci-Number

testfib :: Integer -> Bool
testfib n =
  case (fibb n) of
    Left _ -> False
    Right n' -> isFib n'

isFib :: Integer -> Bool
isFib n = n == a where (_, a, _) = unFib (1, 1) n

unFib :: (Integer, Integer) -> Integer -> (Integer,Integer,Integer)
unFib (a, b) n
  | n < a = (0, 0, 1)
  | n < e = (2*k, c, d)
  | otherwise = (2*k + 1, e, f)
      where
        (k, c, d) = unFib (fibPlus (a, b) (a, b)) n
        (e, f)    = fibPlus (a, b) (c, d)

fibPlus :: (Integer, Integer) -> (Integer, Integer) -> (Integer,Integer)
fibPlus (a, b) (c, d) = (bd - (b - a)*(d - c), a*c + bd)
  where bd = b*d
