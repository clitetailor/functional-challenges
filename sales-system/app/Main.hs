module Main where

import Control.Concurrent.Async (async, wait)
import Control.Monad (forM_)
import Control.Monad.STM (atomically)
import Product (Product (..))
import Ship (ship)
import Shop as Sh (getProducts, newShop)
import Supplier as S (getProducts, newSupplierWithProducts)
import Warehouse as W (getProducts, newWarehouse)

main :: IO ()
main = do
  shop1 <- atomically $ newShop
  shop2 <- atomically $ newShop

  supplier <-
    atomically $
      newSupplierWithProducts
        [ Product
            { name = "jacket",
              price = 200
            },
          Product
            { name = "jean",
              price = 150
            },
          Product
            { name = "flower vase",
              price = 50
            }
        ]

  warehouse <- atomically $ newWarehouse

  thread1 <- async $ ship supplier warehouse
  thread2 <- async $ ship supplier shop1
  thread3 <- async $ ship warehouse shop2

  forM_ [thread1, thread2, thread3] wait

  (>>=)
    ( atomically $
        S.getProducts supplier
    )
    ( \products ->
        putStrLn $ show $ length products
    )
  (>>=)
    ( atomically $
        W.getProducts warehouse
    )
    ( \products ->
        putStrLn $ show $ length products
    )
  (>>=)
    ( atomically $
        Sh.getProducts shop1
    )
    ( \products ->
        putStrLn $ show $ length products
    )
  (>>=)
    ( atomically $
        Sh.getProducts shop2
    )
    ( \products ->
        putStrLn $ show $ length products
    )
