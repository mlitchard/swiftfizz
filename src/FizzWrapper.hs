-- |
-- Module: FizzWrapper
-- Copyright: Copyright (C) 2016 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <michael@schmong.org>
-- Stability: experimental
-- Portability: portable
-- Driver function
 
module FizzWrapper (fizzWrapper) where

import BasicPrelude

import FizzBuzz ( fizzBuzzFib )
import FizzTypes ( prettyPrintFizzError )
import FizzInput

-- | Wrapper is only thing exposed to Main
-- and the cleaning of the input 
-- needs to be seperated from the code doing
-- the conputation.
fizzWrapper :: [Text] -> Text
fizzWrapper input =
  either prettyPrintFizzError unlines  $
  Right <$> fizzBuzzFib               =<<
  convertToPInt                       =<<
  mustHaveOne input  
