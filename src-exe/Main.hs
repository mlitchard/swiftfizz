
import              System.Environment ( getArgs )
import              BasicPrelude hiding (getArgs)

import              Import 

main :: IO ()
main = do -- putStrLn $ pack ("out of order\n")
  input <- getArgs
  putStrLn $ either prettyPrintFizzError unlines $ fizzBuzzFib input
