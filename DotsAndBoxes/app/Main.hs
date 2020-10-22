module Main where

import Lib
import Types

main :: IO ()
main = someFunc

drawGrid :: PlayGrid -> IO ()
drawGrid grid = print grid