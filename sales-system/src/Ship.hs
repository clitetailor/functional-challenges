module Ship where

import Control.Concurrent (threadDelay)
import Control.Concurrent.STM.TVar (readTVar, writeTVar)
import Control.Monad.STM (atomically)
import Data.Sequence (Seq (..))
import Shop as Sh (Shop (..))
import Supplier as S (Supplier (..))
import Warehouse as W (Warehouse (..))

class Ship a b where
  ship :: a -> b -> IO ()

instance Ship Supplier Warehouse where
  ship supplier warehouse = do
    maybeProduct <-
      atomically do
        list <- readTVar $ S.products supplier

        case list of
          (head :<| tail) -> do
            writeTVar (S.products supplier) tail
            return $ Just head
          _ -> do
            return $ Nothing

    threadDelay 100

    case maybeProduct of
      Just product -> do
        atomically do
          list <- readTVar $ W.products warehouse

          writeTVar
            (W.products warehouse)
            (list :|> product)
      Nothing -> return ()

instance Ship Warehouse Shop where
  ship warehouse shop = do
    maybeProduct <-
      atomically do
        list <- readTVar $ W.products warehouse

        case list of
          (head :<| tail) -> do
            writeTVar (W.products warehouse) tail
            return $ Just head
          _ -> do
            return $ Nothing

    threadDelay 100

    case maybeProduct of
      Just product -> do
        atomically do
          list <- readTVar $ Sh.products shop

          writeTVar
            (Sh.products shop)
            (list :|> product)
      Nothing -> return ()

instance Ship Supplier Shop where
  ship supplier shop = do
    maybeProduct <-
      atomically do
        list <- readTVar $ S.products supplier

        case list of
          (head :<| tail) -> do
            writeTVar (S.products supplier) tail
            return $ Just head
          _ -> do
            return $ Nothing

    threadDelay 100

    case maybeProduct of
      Just product -> do
        atomically do
          list <- readTVar $ Sh.products shop

          writeTVar
            (Sh.products shop)
            (list :|> product)
      Nothing -> return ()
