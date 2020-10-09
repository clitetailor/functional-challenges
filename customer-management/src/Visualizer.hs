module Visualizer
  ( Visualizer,
    Visualizable (Visualizable),
    visualize,
    getName,
    getAge,
  )
where

class Visualizer customerType where
  getName :: customerType -> String

  getAge :: customerType -> Int

  visualize :: customerType -> IO ()
  visualize customer =
    putStrLn
      ( "Hello world, my name is "
          <> getName customer
          <> ". I am "
          <> show (getAge customer)
          <> " years old!"
      )

data Visualizable
  = forall a. Visualizer a => Visualizable a

instance Visualizer Visualizable where
  getName (Visualizable customer) = getName customer

  getAge (Visualizable customer) = getAge customer

  visualize (Visualizable customer) = visualize customer
