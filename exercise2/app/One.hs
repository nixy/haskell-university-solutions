module Main where

import System.Environment (getArgs)

import Lib (quickSortInteger)

main :: IO ()
main = do
  args <- getArgs
  putStrLn $ show $ quickSortInteger $ map (read :: String->Integer) args
