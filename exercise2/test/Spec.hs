-- Automatically discover HSpec tests.
-- {-# OPTION_GHC -F -pgmF hspec-discover #-}
module Main where

import Test.Hspec
import Test.QuickCheck

import Lib (fizzbuzz, quickSortInteger, quickSort)

main :: IO ()
main = hspec $ do
  describe "quickSortInteger" $ do
    it "quickSortInteger [3, 10, 1, 5, 2, 4, 5, 0] == [0, 1, 2, 3, 4, 5, 5, 10]" $ do
      quickSortInteger [3, 10, 1, 5, 2, 4, 5, 0] `shouldBe` [0, 1, 2, 3, 4, 5, 5, 10]

    it "is idempotent" $ do
      property $ \xs -> quickSortInteger (quickSortInteger xs) == quickSortInteger xs

  describe "quickSort" $
    context "with support for non-Integer types" $ do
      it "quickSort [3, 10, 1, 5, 2, 4, 5, 0] == [0, 1, 2, 3, 4, 5, 5, 10]" $ do
        quickSort [3, 10, 1, 5, 2, 4, 5, 0] `shouldBe` [0, 1, 2, 3, 4, 5, 5, 10]

  describe "fizzbuzz" $ do
    it "fizzbuzz 15 should start with 'Fizz Buzz'" $ do
      (head $ fizzbuzz 15) == "Fizz Buzz"

-- Test whether a list of orderable types is sorted.
sorted :: Ord a => [a] -> Bool
sorted [] = True
sorted [a] = True
sorted (a:b:xs) = (a <= b) && sorted xs
