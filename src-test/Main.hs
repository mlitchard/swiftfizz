-- |
-- Module:      src-test/Main.hs
-- Copyright:   2016 Michael Litchard
-- License:     BSD3
-- Maintainer:  <Michael Litchard> <michael@schmong.org>

-- A few tests for fizzbuzz demo
module Main (main) where

-- A few tests for fizzbuzz demo

import           BasicPrelude
import           Test.Hspec (hspec)

import           PropTests.Fibonacci
import           PropTests.FizzBuzz
import           UnitTests.Fibonacci
import           UnitTests.Input

main :: IO ()
main = do
  hspec unitFib
  hspec unitInput
  hspec $ propFib upper_bound
  hspec propFizz

upper_bound :: Integer
upper_bound = 100000
