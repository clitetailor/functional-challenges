module CustomerVisualizer
  ( CustomerVisualizer,
    customPrint,
    printOtherInfo,
    getName,
    getAge,
  )
where

import Visualizer as V (Visualizer)

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
