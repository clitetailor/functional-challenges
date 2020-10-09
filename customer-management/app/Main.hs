module Main where

import Control.Monad (forM_)
import Customer (Customer (..))
import InternalCustomer (InternalCustomer (..))
import VipCustomer (VipCustomer (..))
import Visualizer as V (Visualizable (..), printInfo)

main :: IO ()
main = do
  let customers =
        [ Visualizable
            Customer
              { name = "John Smith",
                age = 20
              },
          Visualizable
            VipCustomer
              { basicInfo =
                  Customer
                    { name = "Tim Batte",
                      age = 30
                    },
                vipPoints = 100
              },
          Visualizable
            InternalCustomer
              { basicInfo =
                  Customer
                    { name = "Jenny Lars",
                      age = 40
                    },
                department = "IT"
              }
        ]
  forM_ customers V.printInfo
