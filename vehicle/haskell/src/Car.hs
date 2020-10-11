module Car (Car (..)) where

import Vehicle (Vehicle)

class Vehicle carType => Car carType where
  getEngine :: carType -> String
  getEngine _ = "four-stroke engine"

  drive :: carType -> IO ()
  drive car = do
    putStrLn ("Car engine: " <> getEngine car)
    putStrLn "#############################"

  simulate :: carType -> IO ()
  simulate = drive
