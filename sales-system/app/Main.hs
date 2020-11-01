module Main where

import Control.Concurrent.Async (async, wait)
import Control.Monad (forM, forM_)
import Control.Monad.STM (atomically)
import Data.Foldable (fold)
import Product (Product (..))
import Ship (Ship, ship)
import Shop as Sh (getProducts, newShop)
import Supplier as S (getProducts, newSupplierWithProducts)
import Warehouse as W (getProducts, newWarehouse)

data Shippable = forall a b. (Ship a b) => Shippable a b

main :: IO ()
main = do
  shop1 <- atomically $ newShop
  shop2 <- atomically $ newShop

  supplier <-
    atomically $
      newSupplierWithProducts $
        fold $
          [ replicate
              20
              Product
                { name = "jacket",
                  price = 200
                },
            replicate
              10
              Product
                { name = "jean",
                  price = 150
                },
            replicate
              10
              Product
                { name = "flower vase",
                  price = 80
                },
            replicate
              10
              Product
                { name = "Teddy bear",
                  price = 60
                }
          ]

  warehouse <- atomically $ newWarehouse

  let shippables =
        [ Shippable supplier warehouse,
          Shippable warehouse shop2,
          Shippable supplier shop1
        ]

  threads <-
    forM shippables \(Shippable a b) -> do
      thread <- async do
        forM_ [1 .. 20] \_ -> ship a b
      return thread

  forM_ threads wait

  do
    products <- atomically $ S.getProducts supplier
    putStrLn $ show $ length products
  do
    products <- atomically $ W.getProducts warehouse
    putStrLn $ show $ length products
  do
    products <- atomically $ Sh.getProducts shop1
    putStrLn $ show $ length products
  do
    products <- atomically $ Sh.getProducts shop2
    putStrLn $ show $ length products
