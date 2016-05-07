module FizzWrapper (fizzWrapper) where

import              BasicPrelude

import              FizzBuzz ( fizzBuzzFib )
import              FizzTypes ( prettyPrintFizzError )
import              Input

fizzWrapper :: [Text] -> Text
fizzWrapper input =
  either prettyPrintFizzError unlines  $
  Right <$> fizzBuzzFib               =<<
  convertToPInt                       =<<
  mustHaveOne input  
