module CustomerMasker
  ( MaskedCustomer (..),
    CustomerMasker (..),
  )
where

import CustomerVisualizer as CV
  ( CustomerVisualizer (..),
  )
import Visualizer as V (Visualizer (..))

data MaskedCustomer a = MaskedCustomer
  { fakeName :: String,
    wrapped :: a
  }

instance CustomerVisualizer a => Visualizer (MaskedCustomer a) where
  customPrint maskedCustomer = CV.customPrint maskedCustomer

instance CustomerVisualizer a => CustomerVisualizer (MaskedCustomer a) where
  getName = fakeName

  getAge maskedCustomer =
    getAge (wrapped maskedCustomer)

  printOtherInfo maskedCustomer = do
    CV.printOtherInfo (wrapped maskedCustomer)

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
              wrapped = customer
            }
      else CV.customPrint customer

  printOtherInfo (CustomerMasker customer) =
    CV.printOtherInfo customer
