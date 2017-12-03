module Lib
    ( helloWorld
    , helloWorld2
    , helloWorld3
    ) where

import Control.Monad (forever)

-- Exercise 1-1 
-- Write a program that prints out "Hello, world!" and terminates.
helloWorld :: IO ()
helloWorld = putStrLn "Hello, world!"

-- Exercise 1-2
-- Write a program that welcomes the user, asks for their name, greets the user
-- and then terminates.
helloWorld2 :: IO ()
helloWorld2 = do
    putStrLn "Hey, what's your name?"
    name <- getLine
    putStrLn $ "Nice to meet ya " ++ name ++ "!"

-- Exercise 1-3
-- Wirte a program that executes exercise 1-2 in an infinite loop.
helloWorld3 :: IO ()
helloWorld3 = forever helloWorld2
