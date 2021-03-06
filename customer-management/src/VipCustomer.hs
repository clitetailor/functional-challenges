module VipCustomer
  ( VipCustomer (VipCustomer),
    basicInfo,
    vipPoints,
  )
where

import Customer
  ( Customer,
    age,
    name,
  )
import CustomerVisualizer as CV
  ( CustomerVisualizer (..),
    customPrint,
  )
import Visualizer (Visualizer (..))

data VipCustomer = VipCustomer
  { basicInfo :: Customer,
    vipPoints :: Int
  }

instance CustomerVisualizer VipCustomer where
  getName customer = name (basicInfo customer)

  getAge customer = age (basicInfo customer)

  printOtherInfo customer = do
    putStrLn ("vipPoints = " <> show (vipPoints customer))
    putStrLn "@@@@@@@@@@@@@@@@@@@@@@@@@"

instance Visualizer VipCustomer where
  customPrint customer = do
    CV.customPrint customer
