module Customer
  ( Customer (Customer),
    name,
    age,
  )
where

import CustomerVisualizer as CV
  ( CustomerVisualizer (..),
    customPrint,
  )
import Visualizer (Visualizer (..))

data Customer = Customer
  { name :: String,
    age :: Int
  }

instance CustomerVisualizer Customer where
  getName = name

  getAge = age

instance Visualizer Customer where
  customPrint customer =
    CV.customPrint customer
