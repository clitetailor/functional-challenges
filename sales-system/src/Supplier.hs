module Supplier where

import Control.Concurrent.STM (STM)
import Control.Concurrent.STM.TVar (TVar, newTVar, readTVar)
import Data.Foldable (toList)
import Data.Sequence (Seq (..), fromList)
import Product (Product (..))

data Supplier = Supplier
  { products :: TVar (Seq Product)
  }

newSupplierWithProducts :: [Product] -> STM Supplier
newSupplierWithProducts products = do
  items <- newTVar $ fromList products
  return $ Supplier $ items

getProducts :: Supplier -> STM [Product]
getProducts supplier = do
  items <- readTVar $ products supplier
  return $ toList $ items
