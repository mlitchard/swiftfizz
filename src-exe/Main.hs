
import              System.Environment ( getArgs )

import              Import


main :: IO ()
main = do
  input <- getArgs
  putStrLn $ either show (unlines . (map show)) $ fizzBuzzFib input
