
import              System.Environment ( getArgs )

import              Import


main :: IO ()
main = do
  input <- getArgs
  putStrLn $ either prettyError (unlines . (map show)) $ fizzBuzzFib input
