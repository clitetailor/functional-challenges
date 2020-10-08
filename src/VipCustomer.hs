module VipCustomer ( VipCustomer ( VipCustomer ), name, age, vipPoints ) where

import Visualizer ( Visualizer, visualize )

data VipCustomer = VipCustomer {
  name :: String,
  age :: Int,
  vipPoints :: Int
}

instance Visualizer VipCustomer where
  visualize _ = putStrLn "@@@@@@@@@@@@@@@@@@@@@@@@@@"
