module CustomerMasker
  ( MaskedCustomer (..),
    CustomerMasker (..),
  )
where

import CustomerVisualizer as CV
  ( CustomerVisualizer (..),
  )
import Visualizer as V (Visualizer (..))

data MaskedCustomer = MaskedCustomer
  { fakeName :: String,
    age :: Int
  }

instance Visualizer MaskedCustomer where
  customPrint = CV.customPrint

instance CustomerVisualizer MaskedCustomer where
  getName = fakeName

  getAge = age

data CustomerMasker
  = forall a. CustomerVisualizer a => CustomerMasker a

instance Visualizer CustomerMasker where
  customPrint = CV.customPrint

instance CustomerVisualizer CustomerMasker where
  getName (CustomerMasker customer) = CV.getName customer

  getAge (CustomerMasker customer) = CV.getAge customer

  customPrint (CustomerMasker customer) =
    if CV.getAge customer <= 30
      then
        CV.customPrint
          MaskedCustomer
            { fakeName = "******",
              age = getAge customer
            }
      else CV.customPrint customer
