module Visualizer ( Visualizer, Visualizable ( Visualizable ), visualize ) where

class Visualizer user where
  visualize :: user -> IO ()
  visualize _ = putStrLn "###################################"

data Visualizable = forall a . Visualizer a => Visualizable a

instance Visualizer Visualizable where
  visualize (Visualizable u) = visualize u
