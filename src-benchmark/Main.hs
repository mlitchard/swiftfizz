import Criterion
import Criterion.Main

import Import

main :: IO ()
main = defaultMain [ bench "fizzbuzz 10" (whnf fizzbuzz (10 :: Integer))
                   , bench "fizzbuzz 100" (whnf fizzbuzz (100 :: Integer))
                   , bench "fizzbuzz 1000" (whnf fizzbuzz (1000 :: Integer))
                   ]
