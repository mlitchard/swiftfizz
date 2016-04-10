-- |
-- -- Module: FizzTypes
-- -- Copyright: Copyright (C) 2015 Michael Litchard
-- -- License: LGPL-3
-- -- Maintainer: Michael Litchard <mlitchard@schmong.org>
-- -- Stability: experimental
-- -- Portability: portable

module FizzTypes
  ( 
    -- captures error outcomes
    FizzError  (..)
    -- provides user friendly transformation of FizzError values.
  , prettyError
  ) where

data FizzError
  = NotAnInteger
  | NotPInt
  | OnlyOne
  | NoInput
    deriving Eq

prettyError :: FizzError -> String
prettyError NotAnInteger = "not an integer"
prettyError NotPInt      = "input needs to be zero or greater"
prettyError OnlyOne      = "Just pass in one integer that decribes" ++
                           " the upper bound fibonacci number."
prettyError NoInput      = "You need to pass in an integer that describes" ++ 
                           " the upper bound fibonacci number."
