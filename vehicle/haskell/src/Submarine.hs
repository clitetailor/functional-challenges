module Submarine (Submarine (..)) where

import Vehicle (Vehicle)

class Vehicle submarineType => Submarine submarineType where
  getEngine :: submarineType -> String
  getEngine _ = "gasoline engine"

  dive :: submarineType -> IO ()
  dive submarine = do
    putStrLn ("Submarine engine" <> getEngine submarine)
    putStrLn "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"

  simulate :: submarineType -> IO ()
  simulate = dive
