import              BasicPrelude 
import              FizzWrapper

main :: IO ()
main = do 
  input <- getArgs 
  putStrLn $ fizzWrapper input 

