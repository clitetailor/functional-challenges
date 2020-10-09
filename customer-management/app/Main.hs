module Main where

import Control.Monad (forM_)
import Customer
  ( Customer (Customer),
    DefaultCustomer (DefaultCustomer),
    age,
    name,
  )
import VipCustomer
  ( VipCustomer (VipCustomer),
    VipDefaultCustomer (VipDefaultCustomer),
    age,
    name,
    vipPoints,
  )
import Visualizer
  ( Visualizable (Visualizable),
    visualize,
  )

main :: IO ()
main = do
  let customer1 =
        Customer
          DefaultCustomer
            { name = "Nate Column",
              age = 18
            }
  let customer2 =
        VipCustomer
          VipDefaultCustomer
            { name = "Lia",
              age = 16,
              vipPoints = 1
            }
  forM_
    [Visualizable customer1, Visualizable customer2]
    visualize
