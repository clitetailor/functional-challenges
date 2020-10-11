module Hybrid where

import Aircraft as A (Aircraft (..))
import Car as C (Car (..))
import Submarine as S (Submarine (..))
import Vehicle as V (Vehicle (..))

data Hybrid = Hybrid

instance Car Hybrid

instance Aircraft Hybrid

instance Submarine Hybrid

instance Vehicle Hybrid where
  getEngine _ = "hybrid engine"

  simulate hybrid = do
    putStrLn ("Vehicle engine: " <> V.getEngine hybrid)

    C.drive hybrid
    A.pilot hybrid
    S.dive hybrid
