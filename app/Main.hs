module Main where

import Control.Monad ( forM_ )

import Visualizer ( Visualizable ( Visualizable ), visualize )
import Customer ( Customer ( Customer ), name, age )
import VipCustomer ( VipCustomer ( VipCustomer ), name, age, vipPoints )

main :: IO ()
main = do
  let customer1 = Customer {
    name = "Nate Column",
    age = 18
  }
  let customer2 = VipCustomer {
    name = "Lia",
    age = 16,
    vipPoints = 1
  }
  forM_ [Visualizable customer1, Visualizable customer2] visualize
