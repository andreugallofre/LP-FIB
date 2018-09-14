flatten :: [[Int]] -> [Int]
flatten xs = foldl (++) [] xs