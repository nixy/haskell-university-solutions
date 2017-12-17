module Main where

import System.Environment (getArgs)

import Lib (fizzbuzz)

main :: IO ()
main = do
  args <- getArgs
  putStrLn $ show $ fizzbuzz $ (read :: String->Integer) $ head args
