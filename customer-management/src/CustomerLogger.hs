module CustomerLogger
  ( CustomerLogger (..),
  )
where

import CustomerVisualizer as CV
  ( CustomerVisualizer (..),
  )
import Visualizer as V
  ( Visualizer (..),
  )

data CustomerLogger
  = forall a. CustomerVisualizer a => CustomerLogger a

instance Visualizer CustomerLogger where
  customPrint = CV.customPrint

instance CustomerVisualizer CustomerLogger where
  getName (CustomerLogger customer) = CV.getName customer

  getAge (CustomerLogger customer) = CV.getAge customer

  customPrint (CustomerLogger customer) = do
    putStrLn ("[Log]: Begin CustomPrint for customer name = " <> CV.getName customer)
    CV.customPrint customer
    putStrLn ("[Log]: End CustomPrint for customer name = " <> CV.getName customer)
