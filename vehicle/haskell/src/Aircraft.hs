module Aircraft (Aircraft (..)) where

import Vehicle as V (Vehicle)

class Vehicle aircraftType => Aircraft aircraftType where
  getEngine :: aircraftType -> String
  getEngine _ = "turbofan aircraft engines"

  pilot :: aircraftType -> IO ()
  pilot aircraft = do
    putStrLn ("Aircraft engine: " <> getEngine aircraft)
    putStrLn ">>>>>>>>>>>>>>>>>>>>>>>>>>>"

  simulate :: aircraftType -> IO ()
  simulate = pilot
