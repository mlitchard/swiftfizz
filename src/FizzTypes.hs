-- |
-- Module: FizzTypes
-- Copyright: Copyright (C) 2015 Michael Litchard
-- License: LGPL-3
-- Maintainer: Michael Litchard <mlitchard@schmong.org>
-- Stability: experimental
-- Portability: portable

module FizzTypes
  ( 
    FizzError  (..)
    -- captures error outcomes
  , prettyPrintFizzError
    -- because Show instances are poor form
  ) where

import BasicPrelude
import Data.Text (pack) 

-- | Captures everything that might be wrong with the input
data FizzError
  = NotAnInteger
  | NotPInt
  | OnlyOne
  | NoInput
    deriving (Show,Eq)

-- | Replacement for Show instance
prettyPrintFizzError :: FizzError -> Text
prettyPrintFizzError NotAnInteger = pack "not an integer"
prettyPrintFizzError NotPInt      = pack "input needs to be zero or greater"
prettyPrintFizzError OnlyOne      = 
  pack ( "Just pass in one integer that decribes" <>
         " the upper bound fibonacci number."
       )
prettyPrintFizzError NoInput      = 
  pack ( "You need to pass in an integer that describes" <>
         " the upper bound fibonacci number."
       )
