{-# LANGUAGE OverloadedStrings #-}
-- |
-- Module: FizzInput
-- Copyright: Copyright (C) 2016 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
-- Input handling functions 

module FizzInput
  ( 
    -- | 
    -- These functions are here to transform command-line [Text]
    -- into a positive integer, or flag the input as bad.
    convertToPInt
  , mustHaveOne
  ) where

import              BasicPrelude

import              Data.Either.Utils (maybeToEither)
import              Data.Text (unpack)
import              Text.Read (readMaybe)

import              FizzTypes

-- |
-- takes String and returns either an error or positive Integer
convertToPInt :: Text -> Either FizzError Int
convertToPInt input =
  isPInt =<< toDigit
    where
      toDigit = maybeToEither NotAnInteger $ (readMaybe . unpack) input
      isPInt int = boolToEither (int >= 0) NotPInt int
      
-- |
-- checks to see if number of arguments is correct
mustHaveOne :: [Text] -> Either FizzError Text
mustHaveOne (arg:[]) = Right arg
mustHaveOne []       = Left NoInput
mustHaveOne _        = Left OnlyOne

-- Utility Functions

-- |
-- It is what it says on the tin.
boolToEither :: Bool -> a -> b -> Either a b
boolToEither bool a b = case bool of
  True -> Right b
  False -> Left a
