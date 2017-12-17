module Main where

import System.Environment (getArgs)

import Lib (quickSort)

main :: IO ()
main = do
  args <- getArgs
  putStrLn $ show $ quickSort $ map (read :: String->Integer) args
