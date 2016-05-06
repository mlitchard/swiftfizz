--{-# LANGUAGE OverloadedStrings, QuasiQuotes #-}
module Main (main) where
-- |
-- Module:      src-test/Main.hs
-- Copyright:   2016 Michael Litchard
-- License:     BSD3
-- Maintainer:  <Michael Litchard> <michael@schmong.org>

-- A few tests for fizzbuzz demo

import           BasicPrelude
import           Test.Hspec (hspec)
import           UnitTests.Input
import           UnitTests.Fibonacci
import           PropTests.Fibonacci
import           PropTests.FizzBuzz

main :: IO ()
main = do
  hspec unit_fib
  hspec unit_input
  hspec prop_fib
  hspec prop_fizz
