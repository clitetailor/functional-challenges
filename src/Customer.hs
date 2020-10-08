module Customer ( Customer ( Customer ), name, age ) where

import Visualizer ( Visualizer, visualize )

data Customer = Customer {
  name :: String,
  age :: Int
}

instance Visualizer Customer where
  visualize _ = putStrLn "$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

