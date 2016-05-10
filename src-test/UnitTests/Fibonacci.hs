-- |
-- Module: UnitTests.Fibonacci
-- Copyright: Copyright (C) 2016 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable

module UnitTests.Fibonacci ( unitFib ) where

import           UnitTests.UnitImports

-- |
-- quick sanity test for Fibonacci function
-- property test does the real work
unitFib :: Spec
unitFib = do
  describe "Fibonacci check" $
    it "first 10 fibonacci numbers" $
      fibSeq sample `shouldBe` fibs

-- |
-- sample prevents following error
--    Defaulting the following constraint(s) to type ‘Integer’
--      (Integral i0)
--        arising from a use of ‘genericTake’
--        at src-test/UnitTests/Fibonacci.hs:9:7-17
--      (Num i0)
--        arising from the literal ‘10’
--        at src-test/UnitTests/Fibonacci.hs:9:19-20
--    In the first argument of ‘shouldBe’, namely ‘genericTake 10 fibb’
--    In the second argument of ‘($)’, namely
--      ‘genericTake 10 fibb `shouldBe` fibs’
--    In the second argument of ‘($)’, namely
--      ‘it "first 10 fibonacci numbers"
--       $ genericTake 10 fibb `shouldBe` fibs’

sample :: Int
sample = 10

fibs :: [Integer]
fibs = [0,1,1,2,3,5,8,13,21,34]
  
