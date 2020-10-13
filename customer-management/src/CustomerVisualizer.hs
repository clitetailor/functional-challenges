module CustomerVisualizer
  ( CustomerVisualizer (..),
    CustomerVisualizable (..),
  )
where

import Visualizer as V (Visualizer (..))

class Visualizer customerType => CustomerVisualizer customerType where
  getName :: customerType -> String

  getAge :: customerType -> Int

  customPrint :: customerType -> IO ()
  customPrint customer = do
    putStrLn
      ("name = " <> getName customer)
    putStrLn
      ("age = " <> show (getAge customer))

    printOtherInfo customer

  printOtherInfo :: customerType -> IO ()
  printOtherInfo _ =
    putStrLn
      "$$$$$$$$$$$$$$$$$$$$$$$$$"

data CustomerVisualizable
  = forall a. CustomerVisualizer a => CustomerVisualizable a

instance Visualizer CustomerVisualizable where
  customPrint = CustomerVisualizer.customPrint

instance CustomerVisualizer CustomerVisualizable where
  getName (CustomerVisualizable customer) = getName customer

  getAge (CustomerVisualizable customer) = getAge customer

  customPrint (CustomerVisualizable customer) =
    CustomerVisualizer.customPrint customer

  printOtherInfo (CustomerVisualizable customer) =
    CustomerVisualizer.printOtherInfo customer
