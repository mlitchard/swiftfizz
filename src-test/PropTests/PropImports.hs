module PropTests.PropImports 
  ( module PropTests.PropImports ) where


import BasicPrelude as PropTests.PropImports
import Test.Hspec as PropTests.PropImports (Spec, hspec, describe)
import Test.Hspec.QuickCheck as PropTests.PropImports (modifyMaxSuccess, prop) 
import Test.QuickCheck as PropTests.PropImports (forAll,elements,choose)

import FizzBuzz as PropTests.PropImports
import FizzFib as PropTests.PropImports 
