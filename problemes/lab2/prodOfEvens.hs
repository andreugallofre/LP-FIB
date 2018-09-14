prod :: [Int] -> Int
prod xs = foldl (*) 1 xs

prodOfEvens :: [Int] -> Int
prodOfEvens xs = prod $ filter even xs