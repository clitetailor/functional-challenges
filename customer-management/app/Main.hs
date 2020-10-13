module Main where

import Control.Monad (forM_)
import Customer (Customer (..))
import CustomerLogger (CustomerLogger (..))
import CustomerMasker (CustomerMasker (..))
import CustomerVisualizer
  ( CustomerVisualizable (..),
    CustomerVisualizer (..),
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
  forM_ customers doActions
  where
    doActions :: forall a. CustomerVisualizer a => a -> IO ()
    doActions customer = do
      let customerMasker = CustomerMasker customer
      let customerLogger = CustomerLogger customerMasker
      V.printInfo customerLogger
