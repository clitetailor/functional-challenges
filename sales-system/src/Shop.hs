module Shop where

import Control.Concurrent.STM.TVar (TVar, newTVar, readTVar)
import Control.Monad.STM (STM)
import Data.Foldable (toList)
import Data.Sequence (Seq (..), fromList)
import Product (Product (..))

data Shop = Shop
  { products :: TVar (Seq Product)
  }

newShop :: STM Shop
newShop = do
  list <- newTVar $ fromList []
  return $ Shop $ list

getProducts :: Shop -> STM [Product]
getProducts shop = do
  items <- readTVar $ products $ shop
  return $ toList items
