-- |
-- Module: Input
-- Copyright: Copyright (C) 2015 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable

-- Input handling functions 

module Input
  ( 
    mustHaveOne
  , convertToPInt
  ) where

import              Text.Read (readMaybe)
import              Data.Either.Utils (maybeToEither)
import              ClassyPrelude

import              FizzTypes
-- |
-- takes String and returns either an error or positive Integer

convertToPInt :: String -> Either FizzError Integer
convertToPInt str =
  isPInt =<< toDigit
    where
      toDigit = maybeToEither NotAnInteger (readMaybe str)
      isPInt int = boolToEither (int >= 0) NotPInt int

-- |
-- checks to see if number of arguments is correct
mustHaveOne :: [String] -> Either FizzError String
mustHaveOne (arg:[]) = Right arg
mustHaveOne []       = Left NoInput
mustHaveOne _        = Left OnlyOne


boolToEither :: Bool -> a -> b -> Either a b
boolToEither bool a b = case bool of
  True -> Right b
  False -> Left a
