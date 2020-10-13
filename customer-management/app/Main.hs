module Main where

import Control.Concurrent.Async (async, wait)
import Control.Monad (forM_)
import Customer (Customer (..))
import CustomerLogger (CustomerLogger (..))
import CustomerMasker (CustomerMasker (..))
import CustomerVisualizer
  ( CustomerVisualizable (..),
  )
import InternalCustomer (InternalCustomer (..))
import VipCustomer (VipCustomer (..))
import Visualizer as V (printInfo)

main :: IO ()
main = do
  let customers =
        [ CustomerVisualizable
            Customer
              { name = "John Smith",
                age = 20
              },
          CustomerVisualizable
            VipCustomer
              { basicInfo =
                  Customer
                    { name = "Tim Batte",
                      age = 30
                    },
                vipPoints = 100
              },
          CustomerVisualizable
            InternalCustomer
              { basicInfo =
                  Customer
                    { name = "Jenny Lars",
                      age = 40
                    },
                department = "IT"
              }
        ]

  let wrappedCustomers = fmap addWrappers customers
  threads <- mapM (async . doActions wrappedCustomers) [1 .. 50]
  forM_ threads wait
  where
    addWrappers :: CustomerVisualizable -> CustomerVisualizable
    addWrappers customer =
      CustomerVisualizable
        ( CustomerLogger (CustomerMasker customer)
        )

    doActions :: [CustomerVisualizable] -> Int -> IO ()
    doActions customers nth = do
      forM_ customers V.printInfo
      putStrLn ("#" <> show nth)
