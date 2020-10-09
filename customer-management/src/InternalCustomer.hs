module InternalCustomer
  ( InternalCustomer (InternalCustomer),
    basicInfo,
    department,
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
import Visualizer as V (Visualizer (..))

data InternalCustomer = InternalCustomer
  { basicInfo :: Customer,
    department :: String
  }

instance CustomerVisualizer InternalCustomer where
  getName customer = name (basicInfo customer)

  getAge customer = age (basicInfo customer)

  printOtherInfo customer = do
    putStrLn ("department = " <> department customer)
    putStrLn "&&&&&&&&&&&&&&&&&&&&&"

instance Visualizer InternalCustomer where
  customPrint customer = do
    CV.customPrint customer
