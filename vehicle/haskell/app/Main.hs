module Main where

import Ferrari (Ferrari(..))
import Hybrid (Hybrid (..))

import Vehicle as V
import Car as C
import Aircraft as A
import Submarine as S

main :: IO ()
main = do
  let ferrari = Ferrari

  C.simulate ferrari

  let hybrid = Hybrid
  
  putStrLn "\n1"
  V.simulate hybrid
  
  putStrLn "\n2"
  C.simulate hybrid

  putStrLn "\n3"
  A.simulate hybrid

  putStrLn "\n4"
  S.simulate hybrid
