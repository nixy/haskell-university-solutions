-- file: QuicksortSpec.hs
module Main (main, spec) where

import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "quicksort1" $
  it "runs quicksort on a list of Integers" $ do
    property $ property (sorted . qs)
    

-- Test whether a list of orderable types is sorted.
sorted :: Ord a => [a] -> Bool
sorted [] = True
sorted [a] = True
sorted (a:b:xs) = (a <= b) && sorted xs
