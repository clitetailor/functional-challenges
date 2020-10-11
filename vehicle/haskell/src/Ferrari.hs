module Ferrari where

import Car as C (Car(..))
import Vehicle as V (Vehicle (..))

data Ferrari = Ferrari

instance Vehicle Ferrari where
  getEngine _ = "F154"

instance Car Ferrari where
  getEngine _ = "F154"
