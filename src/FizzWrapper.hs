module FizzWrapper (fizzWrapper) where

import              BasicPrelude

import              FizzBuzz ( fizzBuzzFib )
import              FizzTypes ( prettyPrintFizzError )

fizzWrapper :: [Text] -> Text
fizzWrapper input = either prettyPrintFizzError unlines $ fizzBuzzFib input
  
