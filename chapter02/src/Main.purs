module Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, print)
import Math (sqrt, pi)

diagonal :: Number -> Number -> Number
diagonal width height = sqrt (width * width + height * height)

circleArea :: Number -> Number
circleArea radius = pi * radius * radius

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  print "The diagonal of a triangle of sides 3 and 4 is:"
  print (diagonal 3.0 4.0)
