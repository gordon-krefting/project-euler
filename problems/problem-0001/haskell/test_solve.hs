module Main where

import FizzBuzz (fizzBuzz)
import System.Exit (exitFailure)

check :: (Eq a, Show a) => String -> a -> a -> IO Bool
check name expected actual =
  if expected == actual
    then do
      putStrLn ("PASS " ++ name)
      return True
    else do
      putStrLn ("FAIL " ++ name ++ ": expected " ++ show expected ++ ", got " ++ show actual)
      return False

main :: IO ()
main = do
  results <-
    sequence
      [ check "fizzBuzz 10" 23 (fizzBuzz 10)
      , check "fizzBuzz 1000" 233168 (fizzBuzz 1000)
      ]
  if and results then return () else exitFailure
