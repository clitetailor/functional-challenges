module Customer
  ( Customer (Customer),
    DefaultCustomer (DefaultCustomer),
    name,
    age,
  )
where

import Visualizer as V (Visualizer (..))

data DefaultCustomer = DefaultCustomer
  { name :: String,
    age :: Int
  }

data Customer = Customer DefaultCustomer

instance Visualizer DefaultCustomer where
  getName customer = name customer

  getAge customer = age customer

instance Visualizer Customer where
  getName (Customer customer) = getName customer

  getAge (Customer customer) = getAge customer

  visualize (Customer customer) = do
    putStrLn "@@@@@@@@@@@@@@@@@@@@@@@@"

    visualize customer
