{-# LANGUAGE OverloadedStrings #-}

import BasicPrelude hiding (map,(++))
import Criterion
import Criterion.Main

import FizzBuzz
import FizzFib

main :: IO ()
main = defaultMain $ fizzbuzzTests 1000 -- [ bench "fizzbuzz 10" (whnf fizzbuzz (10 :: Integer))
 --                  , bench "fizzbuzz 100" (whnf fizzbuzz (100 :: Integer))
--                   , bench "fizzbuzz 1000" (whnf fizzbuzz (1000 :: Integer))
--                   ]

fizzbuzzTests :: Integer -> [Benchmark]
fizzbuzzTests amount =
  [ bgroup "fizzbuzz performance test"
     [
       bench "testing fizzbuzz" $ whnf fizzBuzzFib amount
     , bench "testing fizzbuzz 10x" $ whnf fizzBuzzFib (amount * 10)
     , bench "testing fizzbuzz 100x" $ whnf fizzBuzzFib (amount * 100)
     ]
  , bgroup "fibonacci performance test" 
     [
       bench "testing fibonacci" $ whnf fibSeq amount
     , bench "testing fibonacci 10x" $ whnf fibSeq (amount * 10)
     , bench "testing fibonacci 100x" $ whnf fibSeq (amount * 100)  
     ]
  ]
