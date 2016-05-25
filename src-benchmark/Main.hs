{-# LANGUAGE OverloadedStrings #-}

import BasicPrelude hiding (map,(++))
import Criterion
import Criterion.Main

import FizzBuzz
import FizzFib

main :: IO ()
main = defaultMain $ fizzbuzzTests 1000 

fizzbuzzTests :: Int -> [Benchmark]
fizzbuzzTests amount = error ("FizzBuzz benchmarks not implemented")
