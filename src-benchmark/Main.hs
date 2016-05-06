{-# LANGUAGE OverloadedStrings #-}

import BasicPrelude hiding (map,(++))
import Data.List
import Criterion
import Criterion.Main

import FizzBuzz

main :: IO ()
main = defaultMain $ fizzbuzzTests 1000 1000 -- [ bench "fizzbuzz 10" (whnf fizzbuzz (10 :: Integer))
 --                  , bench "fizzbuzz 100" (whnf fizzbuzz (100 :: Integer))
--                   , bench "fizzbuzz 1000" (whnf fizzbuzz (1000 :: Integer))
--                   ]

fizzbuzzTests :: Int -> Int -> [Benchmark]
fizzbuzzTests amount occurences =
      (map (bench "testing fizzbuzz" . whnf fizzbuzz) test_input) <>
      (map (bench "testing fibonacci" . whnf fibb) test_input)
