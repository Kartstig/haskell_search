import Data.List

testData = [0,2,4,6,8]

lessThan :: Int -> (String, String)
lessThan key
  | length filtered > 0 = (" FoundLess    ", show (maximum filtered))
  | otherwise = (" NotFound     ", "X")
    where filtered = findIndices (< key) testData

lessThanEquals :: Int -> (String, String) 
lessThanEquals key
  | length filtered ==  1 = (" FoundExact   ", show (filtered !! 0))
  | length filtered > 1 = (" FoundLess    ", show (maximum filtered))
  | otherwise = (" NotFound     ", "X")
    where filtered = findIndices (<= key) testData

equals :: Int -> (String, String)
equals key
  | length filtered == 1 = (" FoundExact   ", show (filtered !! 0))
  | otherwise = (" NotFound     ", "X")
    where filtered = findIndices (== key) testData

greaterThanEquals :: Int -> (String, String)
greaterThanEquals key
  | length filtered == 1 = (" FoundExact   ", show (filtered !! 0))
  | length filtered > 0 = (" FoundGreater ", show (minimum filtered))
  | otherwise = (" NotFound     ", "X")
    where filtered = findIndices (>= key) testData

greaterThan :: Int -> (String, String)
greaterThan key
  | length filtered > 0 = (" FoundGreater ", show (minimum filtered))
  | otherwise = (" NotFound     ", "X")
    where filtered = findIndices (> key) testData

getInt :: IO Int
getInt = do
  readLn

main = do 
  putStrLn "Enter a key: "
  key <- getInt
  putStrLn "+-----+-------------------+--------------+-------+"
  putStrLn "| Key | Type              | Returns      | Index |"
  putStrLn "+-----+-------------------+--------------+-------+"
  putStrLn ("| " ++ (show key) ++ "  | " ++ "LessThan          |" ++ (fst (lessThan key)) ++ "|  " ++ (snd (lessThan key)) ++ "  |")
  putStrLn ("| " ++ (show key) ++ "  | " ++ "LessThanEquals    |" ++ (fst (lessThanEquals key)) ++ "|  " ++ (snd (lessThanEquals key)) ++ "  |")
  putStrLn ("| " ++ (show key) ++ "  | " ++ "Equals            |" ++ (fst (equals key)) ++ "|  " ++ (snd (equals key)) ++ "  |")
  putStrLn ("| " ++ (show key) ++ "  | " ++ "GreaterThanEquals |" ++ (fst (greaterThanEquals key)) ++ "|  " ++ (snd (greaterThanEquals key)) ++ "  |")
  putStrLn ("| " ++ (show key) ++ "  | " ++ "GreaterThan       |" ++ (fst (greaterThan key)) ++ "|  " ++ (snd (greaterThan key)) ++ "  |")
  putStrLn "+-----+-------------------+--------------+-------+"
  main

