{-# LANGUAGE OverloadedStrings #-}
-- |
-- Module: Input
-- Copyright: Copyright (C) 2015 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
-- Input handling functions 

module FizzInput
  ( 
    -- | These functions are here to transform command-line [Text]
    -- into a positive integer
    mustHaveOne
  , convertToPInt
  ) where

import              BasicPrelude

import              Text.Read (readMaybe)
import              Data.Either.Utils (maybeToEither)
import              Data.Text (unpack) 
import              FizzTypes

-- |
-- takes String and returns either an error or positive Integer
convertToPInt :: Text -> Either FizzError Integer
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

-- |
-- It is what it says on the tin.
boolToEither :: Bool -> a -> b -> Either a b
boolToEither bool a b = case bool of
  True -> Right b
  False -> Left a
