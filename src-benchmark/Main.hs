import Criterion
import Criterion.Main

import Import

main :: IO ()
main = defaultMain [bench "fizzbuzz 10" (whnf fizzbuzz (10 :: Integer))]
