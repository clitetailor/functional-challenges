module Visualizer
  ( Visualizer (..),
    Visualizable (..),
  )
where

class Visualizer customerType where
  customPrint :: customerType -> IO ()

  printInfo :: customerType -> IO ()
  printInfo customer = do
    putStrLn "###################"

    customPrint customer

    putStrLn ""

data Visualizable
  = forall a. Visualizer a => Visualizable a

instance Visualizer Visualizable where
  customPrint (Visualizable customer) = customPrint customer
