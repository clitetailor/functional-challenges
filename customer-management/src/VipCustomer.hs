module VipCustomer
  ( VipCustomer (VipCustomer),
    VipDefaultCustomer (VipDefaultCustomer),
    name,
    age,
    vipPoints,
  )
where

import Visualizer as V (Visualizer (..))

data VipDefaultCustomer = VipDefaultCustomer
  { name :: String,
    age :: Int,
    vipPoints :: Int
  }

newtype VipCustomer = VipCustomer VipDefaultCustomer

instance Visualizer VipDefaultCustomer where
  getName customer = name customer <> " (VIP)"

  getAge customer = age customer

instance Visualizer VipCustomer where
  getName (VipCustomer customer) = getName customer

  getAge (VipCustomer customer) = age customer

  visualize (VipCustomer customer) = do
    putStrLn "@@@@@@@@@@@@@@@@@@@@@@@@@"

    visualize customer
