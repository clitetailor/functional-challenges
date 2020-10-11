module Vehicle (Vehicle (..)) where

class Vehicle vehicleType where
  getEngine :: vehicleType -> String

  simulate :: vehicleType -> IO ()
  simulate vehicle = do
    putStrLn ("Vehicle engine: " <> getEngine vehicle)
