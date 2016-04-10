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
  ) where

import ClassyPrelude

data FizzError
  = NotAnInteger
  | NotPInt
  | OnlyOne
  | NoInput
    deriving Eq

instance Show FizzError where
  show NotAnInteger = "not an integer"
  show NotPInt      = "input needs to be zero or greater"
  show OnlyOne      = "Just pass in one integer that decribes" ++
                    " the upper bound fibonacci number."
  show NoInput      = "You need to pass in an integer that describes" ++ 
                    " the upper bound fibonacci number."
