module Product where

import Control.Concurrent.STM.TVar (TVar)
import Data.Sequence (Seq)

data Product = Product
  { name :: String,
    price :: Integer
  }
