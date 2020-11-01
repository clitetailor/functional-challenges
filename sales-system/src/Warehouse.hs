module Warehouse where

import Control.Concurrent.STM (STM)
import Control.Concurrent.STM.TVar (TVar, newTVar, readTVar)
import Data.Foldable (toList)
import Data.Sequence (Seq (..), fromList)
import Product (Product (..))

data Warehouse = Warehouse
  { products :: TVar (Seq Product)
  }

newWarehouse :: STM Warehouse
newWarehouse = do
  products <- newTVar $ fromList []
  return $ Warehouse products

getProducts :: Warehouse -> STM [Product]
getProducts warehouse = do
  items <- readTVar $ products warehouse
  return $ toList $ items
