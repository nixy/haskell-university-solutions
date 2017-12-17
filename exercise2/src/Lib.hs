module Lib
    ( quickSortInteger
    , quickSort
    , fizzbuzz
    ) where

quickSortInteger :: [Integer] -> [Integer]
quickSortInteger [] = []
quickSortInteger (pivot:list) = quickSortInteger lesser ++
                                [pivot] ++
                                quickSortInteger greater 
    where lesser = filter (<= pivot) list
          greater = filter (> pivot) list

quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (pivot:list) = quickSort lesser ++
                         [pivot] ++
                         quickSort greater 
    where lesser = filter (<= pivot) list
          greater = filter (> pivot) list

fizzbuzz :: Integer -> [String]
fizzbuzz 0 = []
fizzbuzz n
    | fizz n && buzz n = "Fizz Buzz" : fizzbuzz (n-1)
    | buzz n = "Buzz" : fizzbuzz (n-1)
    | fizz n = "Fizz" : fizzbuzz (n-1)
    | otherwise = show n : fizzbuzz (n-1)
    where
        fizz n = n `mod` 3 == 0 
        buzz n = n `mod` 5 == 0
